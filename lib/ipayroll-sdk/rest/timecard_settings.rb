module IpayrollSdk
  module Rest
    class TimecardSettings
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::TimecardEntry
        @resource_uri = '/api/v1/timecard/entry'
      end

      # def timecard_settings(orgNumber)
      #   perform_get_request_for_resources('/timecard/settings', IpayrollSdk::Models::TimecardEntry)
      # end

    end
  end
end