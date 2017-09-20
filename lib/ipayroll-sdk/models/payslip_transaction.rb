module IpayrollSdk
  module Models

    class PayslipTransaction < IpayrollSdk::Base::Resource

      attr_reader :amount, :quantity, :description, :notes, :displayQuantity

    end
  end
end
