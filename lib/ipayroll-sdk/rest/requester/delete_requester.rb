module IpayrollSdk
  module Rest
    module Requester
      module DeleteRequester

        def delete(id)
          @requester.perform_delete_request_for_resource("#{@resource_uri}/#{id}")
        end

      end
    end
  end
end
