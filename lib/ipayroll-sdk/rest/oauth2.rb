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
        token = @rest_client.fetch_access_token!
        at = IpayrollSdk::Models::AccessToken.new(token);
      end

      def refresh_access_token
        token = @rest_client.refresh!
        at = IpayrollSdk::Models::AccessToken.new(token);
      end

      def connect_with_refresh_token(refresh_token)
        @rest_client.refresh_token = refresh_token;
        refresh_access_token
      end

      def connect_with_access_token(access_token)
        @rest_client.update_token!(access_token.attrs)
        refresh_access_token
      end

    end
  end
end