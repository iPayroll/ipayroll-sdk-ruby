module IpayrollSdk
  module Rest
    class LeaveRequests
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::PayRate
        @resource_uri = "/api/v1/leaves/requests"
      end

      def get_outstanding()
        get 'current'
      end

    end
  end
end
