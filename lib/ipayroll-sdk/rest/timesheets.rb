module IpayrollSdk
  module Rest
    class Timesheets

      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::CreateRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client)
        @rest_client = rest_client
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::Timesheet
        @resource_uri = '/api/v1/timesheets'

      end

      def transactions(timesheet_id)
        return TimesheetsTransactions.new(@rest_client, timesheet_id);
      end

      def delete_transaction(timesheet_id, transaction_id)
        transactions(timesheet_id).delete(transaction_id)
      end

    end
  end
end