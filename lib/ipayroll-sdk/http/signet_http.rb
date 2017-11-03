require "signet/oauth_2/client"

module IpayrollSdk
  module Http
    class SignetHttp < Signet::OAuth2::Client

      def initialize(options={})
        super(options)
        @token_updater = options[:token_updater]
        @base_url = options[:base_url]
        @requester = Requester.new(self, @base_url)
      end

      def authorization_uri(options={})
        # Normalize external input
        options = deep_hash_normalize(options)

        return nil if @authorization_uri == nil
        unless options[:response_type]
          options[:response_type] = :code
        end
        unless options[:access_type]
          options[:access_type] = :offline
        end
        options[:client_id] ||= self.client_id
        options[:redirect_uri] ||= self.redirect_uri
        if options[:prompt] && options[:approval_prompt]
          raise ArgumentError, "prompt and approval_prompt are mutually exclusive parameters"
        end
        if !options[:client_id]
          raise ArgumentError, "Missing required client identifier."
        end
        unless options[:redirect_uri]
          raise ArgumentError, "Missing required redirect URI."
        end
        if !options[:scope] && self.scope
          options[:scope] = self.scope.join(' ')
        end
        options[:state] = self.state unless options[:state]
        options.merge!(self.additional_parameters.merge(options[:additional_parameters] || {}))
        options.delete(:additional_parameters)
        options = Hash[options.map do |key, option|
          [key.to_s, option]
        end]
        uri = Addressable::URI.parse(
            ::Signet::OAuth2.generate_authorization_uri(
                @authorization_uri, options
            )
        )

        #DISABLE HTTPS checks

        # if uri.normalized_scheme != 'https'
        #   raise Signet::UnsafeOperationError,
        #         'Authorization endpoint must be protected by TLS.'
        # end
        return uri
      end

      def fetch_access_token!(options={})
        token = super(options)
        if(!@token_updater.nil?)
          @token_updater.update(token)
        end
        token
      end

      def requester
        @requester
      end

    end
  end
end