require 'ipayroll-sdk/base/resource'

module IpayrollSdk
  module Models
    class Link < IpayrollSdk::Base::AttrReader

      attr_reader :rel
      object_attr_reader :href, URI

    end
  end
end