module IpayrollSdk
  module Rest
    module Requester
      module LinkRequester

        def link_resources(link)
          @requester.perform_get_request_for_resources(link.href, @resource_clazz)
        end

        def link_resource(link)
          @requester.perform_get_request_for_resource(link.href, @resource_clazz)
        end

      end
    end
  end
end
