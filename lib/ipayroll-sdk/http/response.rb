require 'ipayroll-sdk/base/resources'
require 'ipayroll-sdk/errors/rest_error'
module IpayrollSdk
  module Http
    class Response

      attr_reader :response

      def initialize(response)
        @response = response
      end

      def extract_resource (klass)
        objs = fail_or_extract_response_body
        klass.new(objs)
      end

      def extract_resources(klass)
        objs = fail_or_extract_response_body
        objs.collect do |obj|
          klass.new(obj)
        end
      end


      def extract_collection(klass)
        objs = fail_or_extract_response_body
        IpayrollSdk::Base::Resources.new(objs, :content_klass => klass)
      end

      private

      def fail_or_extract_response_body
        check_error
        parse_body
      end

      def parse_body
        MultiJson.load(@response.body, :symbolize_keys => true)
      end

      def check_error
        error = IpayrollSdk::Errors::RestError::ERRORS[@response.status]
        unless error.nil?
          body = parse_body
          raise error.from_response(body, @response.status)
        end
      end

    end
  end
end