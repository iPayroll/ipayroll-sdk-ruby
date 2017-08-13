module IpayrollSdk
  module Models
      class PayRate < IpayrollSdk::Base::Resource
        attr_reader :hourly_rate, :annual_rate, :rate, :code, :divisor, :pay_scale_code
    end
  end
end
