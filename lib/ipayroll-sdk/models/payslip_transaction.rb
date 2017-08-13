module IpayrollSdk
  module Models

    class PayslipTransaction < IpayrollSdk::Base::Resource

      attr_reader :amount, :quantity, :charity, :description, :notes

    end
  end
end
