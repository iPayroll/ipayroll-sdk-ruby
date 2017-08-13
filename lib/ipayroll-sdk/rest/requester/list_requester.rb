module IpayrollSdk
  module Rest
    module Requester
      module ListRequester

        def list(page=nil)
          params = {}
          unless page.nil?
            params = page.to_hash
          end
          @requester.perform_get_request_for_resources("#{@resource_uri}", @resource_clazz, params)
        end

      end
    end
  end
end
