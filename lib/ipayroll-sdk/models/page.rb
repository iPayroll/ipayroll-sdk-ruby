module IpayrollSdk
  module Models
    class Page < IpayrollSdk::Base::AttrReader

      attr_reader :size, :total_elements, :total_pages, :number

    end
  end
end