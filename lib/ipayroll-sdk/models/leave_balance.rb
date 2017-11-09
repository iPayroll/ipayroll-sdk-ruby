require 'ipayroll-sdk/models/leave_balance_type'
module IpayrollSdk
  module Models
    class LeaveBalance < IpayrollSdk::Base::Resource

      attr_reader :employee_id, :entitled, :accrued, :taken, :balance,
                  :next_anniversary_date, :last_anniversary_date

      object_attr_reader :leave_balance_type, IpayrollSdk::Models::LeaveBalanceType

    end
  end
end
