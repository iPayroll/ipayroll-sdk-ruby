module IpayrollSdk
  module Rest
    class CustomFields
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client, employee_id)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::CustomField
        @resource_uri = "/api/v1/employees/#{employee_id}/customfields"
      end

      def list_by_category(category, page = nil)
        params = {}
        unless page.nil?
          params = page.to_hash
        end
        @requester.perform_get_request_for_resources("#{@resource_uri}/#{category}", @resource_clazz, params)
      end

      def get_by_category_and_id(category, id, params={})
        @requester.perform_get_request_for_resource("#{@resource_uri}/#{category}/#{id}", @resource_clazz)
      end

    end
  end
end
