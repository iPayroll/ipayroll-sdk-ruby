module IpayrollSdk
  module Models
    class AccessToken <  IpayrollSdk::Base::AttrReader

      attr_reader :access_token, :token_type, :refresh_token, :expires_in, :scope

    end
  end
end