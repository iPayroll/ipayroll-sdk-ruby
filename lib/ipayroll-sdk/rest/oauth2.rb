module IpayrollSdk
  module Rest
    class Oauth2

      def initialize(restClient)
        @restClient = restClient
      end

      def is_connected
        !@restClient.access_token.nil?
      end

      def authorization_url
        @restClient.authorization_uri.to_s
      end

      def exchange_authorization_code_for_access_token(code)
        @restClient.code = code;
        @restClient.fetch_access_token!
      end

      def refresh_access_token
        @restClient.refresh!
      end

    end
  end
end
