module IpayrollSdk
  module Rest
    class Employees
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::CreateRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(restClient)
        @requester = restClient.requester
        @resource_clazz = IpayrollSdk::Models::Employee
        @resource_uri = '/api/v1/employees'
      end

    end
  end
end
