module IpayrollSdk
  module Rest
    class EmployeeLeaveRequests
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client, employee_id)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::LeaveRequest
        @resource_uri = "/api/v1/employees/#{employee_id}/leaves/requests"
      end

      def list_outstanding
        @requester.perform_get_request_for_resources("#{@resource_uri}/current", @resource_clazz)
      end

    end
  end
end