module IpayrollSdk
  module Rest
    class Payslips
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::Payslip
        @resource_uri = "/api/v1/payslips"
      end

      def get_by_employee_id(employee_id, params = {})
        @requester.perform_get_request_for_resource("#{@resource_uri}/employees/#{employee_id}", @resource_clazz)
      end

      def list_by_payroll(payroll_id, page = nil)
        params = {}
        unless page.nil?
          params = page.to_hash
        end
        @requester.perform_get_request_for_resources("#{@resource_uri}/#{payroll_id}", @resource_clazz, params)
      end

      def get_by_payroll_and_by_employee_id(payroll_id, employee_id, params = {})
        @requester.perform_get_request_for_resource(
            "#{@resource_uri}/#{payroll_id}/employees/#{employee_id}", @resource_clazz)
      end

    end
  end
end
