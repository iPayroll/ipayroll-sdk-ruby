module IpayrollSdk
  module Models

    class PayslipLeaveBalance < IpayrollSdk::Base::Resource

      attr_reader :balance_name, :hours, :days, :amount

    end
  end
end