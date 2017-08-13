module IpayrollSdk
  module Errors
    class RestError < StandardError

      ClientError = Class.new(self)
      BadRequest = Class.new(ClientError)
      Unauthorized = Class.new(ClientError)
      Forbidden = Class.new(ClientError)
      NotFound = Class.new(ClientError)
      Conflict = Class.new(ClientError)
      PreconditionFailed = Class.new(ClientError)
      UnprocessableEntity = Class.new(ClientError)
      Locked = Class.new(ClientError)

      ServerError = Class.new(self)
      InternalServerError = Class.new(ServerError)
      NotImplemented = Class.new(ServerError)

      ERRORS = {
          400 => IpayrollSdk::Errors::RestError::BadRequest,
          401 => IpayrollSdk::Errors::RestError::Unauthorized,
          403 => IpayrollSdk::Errors::RestError::Forbidden,
          404 => IpayrollSdk::Errors::RestError::NotFound,
          409 => IpayrollSdk::Errors::RestError::Conflict,
          412 => IpayrollSdk::Errors::RestError::PreconditionFailed,
          422 => IpayrollSdk::Errors::RestError::UnprocessableEntity,
          423 => IpayrollSdk::Errors::RestError::Locked,
          500 => IpayrollSdk::Errors::RestError::InternalServerError
      }.freeze

      class << self

        def from_response(body, code)
          new(body[:id], body[:messages], code)
        end

      end

      attr_reader :id, :messages, :code

      def initialize(id, messages = [], code = nil)
        super(asMessage(messages))
        @id = id
        @messages = messages
        @code = code
      end

      def asMessage(messages)
        messages.join(", ")
      end
    end
  end
end
