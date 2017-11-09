module IpayrollSdk
  module Rest
    class LeaveRequests
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::CreateRequester
      include IpayrollSdk::Rest::Requester::UpdateRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::LeaveRequest
        @resource_uri = "/api/v1/leaves/requests"
      end

      def list_outstanding
        @requester.perform_get_request_for_resources("#{@resource_uri}/current", @resource_clazz)
      end

    end
  end
end
