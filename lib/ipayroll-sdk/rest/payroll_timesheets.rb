module IpayrollSdk
  module Rest
    class PayrollTimesheets

      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client, payroll_id)
        @rest_client = rest_client
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::Timesheet
        @resource_uri = "/api/v1/payrolls/#{payroll_id}/timesheets"
      end

    end
  end
end