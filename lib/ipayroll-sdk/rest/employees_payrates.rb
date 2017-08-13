module IpayrollSdk
  module Rest
    class EmployeesPayrates
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client, employee_id)
        @requester = restClient.requester
        @resource_clazz = IpayrollSdk::Models::PayRate
        @resource_uri = "/api/v1/employees/#{employee_id}/payrates"
      end

    end
  end
end