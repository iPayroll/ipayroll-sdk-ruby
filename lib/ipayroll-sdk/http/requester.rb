require 'ipayroll-sdk/errors/authorization_error'
module IpayrollSdk
  module Http
    class Requester

      def initialize(restClient, base_url, auto_refresh, auto_refresh_count)
        @restClient = restClient
        @base_url = base_url
        @auto_refresh = auto_refresh
        @auto_refresh_count = auto_refresh_count
      end

      def perform_get_request_for_resources(path, klass, parameters = {})
        response = perform_request('get', path, parameters)
        response.extract_collection(klass)
      end

      def perform_get_request_for_resource(path, klass, parameters = {})
        response = perform_request('get', path, parameters)
        response.extract_resource(klass)
      end

      def perform_post_request_for_resources(path, data, klass, parameters = {})
        options = add_body_to_send(data)
        response = perform_request('post', path, parameters, options)
        response.extract_resources(klass)
      end

      def perform_put_request_for_resource(path, data, klass, parameters = {})
        options = add_body_to_send(data.attrs)
        response = perform_request('put', path, parameters, options)
        response.extract_resource(klass)
      end

      def perform_delete_request_for_resource(path, parameters = {})
        response = perform_request('delete', path, parameters)
      end

      private

      def add_body_to_send(data)
        options = {};
        options[:body] = MultiJson.dump(data)
        options[:headers] = {'Content-Type' => 'application/json'}
        options
      end

      def perform_request(request_method, path, parameters, options = {}, count = 0)
        begin
          response = @restClient.fetch_protected_resource(
              :uri => buildUri(path, parameters),
              :method => request_method,
              :body => options[:body],
              :headers => options[:headers]
          )
          Response.new(response)
        rescue Signet::AuthorizationError => e
          handleAuthorizationError(request_method, path, parameters, options, count, e)
        rescue ArgumentError => e
          raise ::IpayrollSdk::Errors::AuthorizationError.new(
              e.message
          )
        end
      end

      def handleAuthorizationError(request_method, path, parameters, options, count, e)
        if (@auto_refresh && count < @auto_refresh_count)
          @restClient.fetch_access_token!
          count += 1
          return perform_request(request_method, path, parameters, options, count);
        end
        raise ::IpayrollSdk::Errors::AuthorizationError.new(
            e.message, :request => e.request, :response => e.response
        )
      end

      def buildUri(path, parameters = {})
        uri = path
        unless uri.is_a? URI
          uri = URI.parse(@base_url +  URI.encode(path))
        end
        uri.query = [uri.query, parameters.to_query].compact.join('&').to_s
        uri.to_s
      end

    end
  end
end
