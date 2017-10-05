module IpayrollSdk
  module Models
    class PayElementRate < IpayrollSdk::Base::AttrReader

      attr_reader :reporting_group_name, :description, :taxable_pay_per_week, :hours_per_week, :rate,
                  :years, :multiplier
    end
  end
end
