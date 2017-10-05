require 'ipayroll-sdk/base/attr_reader'

module IpayrollSdk
  module Base
    class Resource < AttrReader
      attr_reader :id
    end
  end
end