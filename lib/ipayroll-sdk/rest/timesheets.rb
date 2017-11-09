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
        TimesheetTransactions.new(@rest_client, timesheet_id);
      end

      def delete_transaction(timesheet_id, transaction_id)
        transactions(timesheet_id).delete(transaction_id)
      end

      def get_by_payroll_id(timesheet_id, payroll_id)
        url = "/api/v1/timesheets/#{timesheet_id}/payrolls/#{payroll_id}"
        @requester.perform_get_request_for_resource(url, @resource_clazz)
      end
    end
  end
end