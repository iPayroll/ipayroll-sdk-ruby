 module IpayrollSdk
  module Models
    class Address < IpayrollSdk::Base::AttrReader

      attr_reader :address_line1, :address_line2, :suburb, :city, :post_code, :country

    end
  end
end
