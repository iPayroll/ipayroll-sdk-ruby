module IpayrollSdk
  module Errors
    class AuthorizationError < StandardError

      attr_reader :request, :response, :options, :code, :description, :uri

      def initialize(message, options={})
        super(message)
        @options = options
        @request = options[:request]
        @response = options[:response]
        @code = options[:code]
        @description = options[:description]
        @uri = Addressable::URI.parse(options[:uri])
      end

    end
  end
end