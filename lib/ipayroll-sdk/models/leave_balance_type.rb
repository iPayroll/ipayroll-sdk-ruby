module IpayrollSdk
  module Models

    class LeaveBalanceType < IpayrollSdk::Base::AttrReader
      attr_reader :leave_type, :name, :unit
    end
  end
end
