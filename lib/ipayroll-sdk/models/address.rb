module IpayrollSdk
  module Models
    class Address < IpayrollSdk::Base::Resource

      attr_reader :address_line1, :address_line2, :suburb, :city, :state, :post_code, :country

    end
  end
end
