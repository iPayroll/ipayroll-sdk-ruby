module IpayrollSdk
  module Models
    class LeaveEntitlementRule < IpayrollSdk::Base::AttrReader

      attr_reader :starts_after_years, :starts_after_months, :frequency_years, :frequency_months,
                  :entitlement_days, :entitlement_max_days, :leave_accrual_method, :accrual_percentage
    end
  end
end