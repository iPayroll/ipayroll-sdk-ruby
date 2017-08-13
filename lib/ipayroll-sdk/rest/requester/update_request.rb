module IpayrollSdk
  module Rest
    module Requester
      module UpdateRequester

        def update(id, resource)
          @requester.perform_put_request_for_resource("#{@resource_uri}/#{id}", resource,  @resource_clazz)
        end

      end
    end
  end
end
