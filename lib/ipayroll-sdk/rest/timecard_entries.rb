require 'ipayroll-sdk/rest/requester/delete_requester'
require 'ipayroll-sdk/rest/requester/update_request'
module IpayrollSdk
  module Rest
    class TimecardEntries
      include IpayrollSdk::Rest::Requester::LinkRequester
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::DeleteRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::CreateRequester
      include IpayrollSdk::Rest::Requester::UpdateRequester

      def initialize(restClient)
        @requester = restClient.requester
        @resource_clazz = IpayrollSdk::Models::TimecardEntry
        @resource_uri = '/api/v1/timecard/entry'
      end

      # NEED a change to accept search paramater
      # List<ENTRY> get(String employeeId, String startTime, String endTime, Long activityId, String status, Integer orgNumber);
      # def timecard_entries(employeeId, startTime, endTime, activityId, status)
      #   perform_get_request_for_resources('/api/v1/timecard/entry', IpayrollSdk::Models::/api/v1/timecard/entry)
      # end

      def get(id, timecardEntriesListParam)
        @requester.perform_get_request_for_resource("#{@resource_uri}/#{id}", @resource_clazz, timecardEntriesListParam.to_hash)
      end

      # submitDrafts

    end
  end
end
