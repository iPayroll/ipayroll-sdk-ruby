module IpayrollSdk
  module Models
    class PayrollPayFrequency < IpayrollSdk::Base::AttrReader
      attr_reader :pay_frequency, :paid_to_date, :included
    end
  end
end