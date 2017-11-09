module IpayrollSdk
  module Rest
    class Payrolls
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::Payroll
        @resource_uri = "/api/v1/payrolls"
      end

      def get_current
        get 'current'
      end

    end
  end
end