module IpayrollSdk
  module Rest
    class Oauth2

      def initialize(rest_client)
        @rest_client = rest_client
      end

      def is_connected
        !@rest_client.access_token.nil?
      end

      def authorization_url
        @rest_client.authorization_uri.to_s
      end

      def exchange_authorization_code_for_access_token(code)
        @rest_client.code = code;
        @rest_client.fetch_access_token!
      end

      def refresh_access_token
        @rest_client.refresh!
      end

    end
  end
end
