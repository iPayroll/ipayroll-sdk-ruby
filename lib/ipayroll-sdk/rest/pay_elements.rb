module IpayrollSdk
  module Rest
    class PayElements
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::PayElement
        @resource_uri = "/api/v1/leaves/payelements"
      end

    end
  end
end
