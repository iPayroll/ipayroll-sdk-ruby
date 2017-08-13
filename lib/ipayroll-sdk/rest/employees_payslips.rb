module IpayrollSdk
  module Rest
    class EmployeesLeaveRequests
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client, employee_id)
        @requester = restClient.requester
        @resource_clazz = IpayrollSdk::Models::LeaveRequest
        @resource_uri = "/api/v1/payslips/employees/#{employee_id}"
      end

      def get_outstanding
        perform_get_request_for_resource("#{@resource_uri}/current", @resource_clazz)
      end

    end
  end
end