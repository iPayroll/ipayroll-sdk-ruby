require 'ipayroll-sdk/models/leave_balance_type'
module IpayrollSdk
  module Models
    class LeaveBalance < IpayrollSdk::Base::Resource

      attr_reader :hourly_rate, :annual_rate, :rate, :code, :divisor

      object_attr_reader :leave_balance_type, IpayrollSdk::Models::LeaveBalanceType

    end
  end
end
