module IpayrollSdk
  module Rest
    class EmployeesLeaveBalances
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client, employee_id)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::LeaveBalance
        @resource_uri = "/api/v1/employees/#{employee_id}/leaves/balances"
      end

    end
  end
end