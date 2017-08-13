module IpayrollSdk
  module Rest
    class CostCentres
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::CreateRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(restClient)
        @requester = restClient.requester
        @resource_clazz = IpayrollSdk::Models::CostCentre
        @resource_uri = '/api/v1/costcentres'
      end

    end
  end
end
