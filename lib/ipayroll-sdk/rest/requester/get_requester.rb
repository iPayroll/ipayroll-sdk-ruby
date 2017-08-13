module IpayrollSdk
  module Rest
    module Requester
      module GetRequester

        def get(id, params={})
          @requester.perform_get_request_for_resource("#{@resource_uri}/#{id}", @resource_clazz)
        end

      end
    end
  end
end
