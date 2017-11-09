module IpayrollSdk
  module Rest
    class TimesheetsTransactions
      include IpayrollSdk::Rest::Requester::DeleteRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client, timesheet_id)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::TimesheetTransaction
        @resource_uri = "/api/v1/timesheets/#{timesheet_id}/transactions"
      end
    end

  end
end