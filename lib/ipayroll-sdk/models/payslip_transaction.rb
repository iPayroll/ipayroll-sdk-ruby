module IpayrollSdk
  module Models

    class PayslipTransaction < IpayrollSdk::Base::AttrReader

      attr_reader :amount, :quantity, :description, :notes, :displayQuantity

    end
  end
end
