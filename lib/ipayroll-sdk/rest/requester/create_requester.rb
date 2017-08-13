module IpayrollSdk
  module Rest
    module Requester
      module CreateRequester

        def create(resources)
          @requester.perform_post_request_for_resources(@resource_uri, resources, @resource_clazz)
        end

      end
    end
  end
end
