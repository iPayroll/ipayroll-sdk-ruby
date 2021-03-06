module IpayrollSdk
  module Models
    class LeaveRequest < IpayrollSdk::Base::Resource

      attr_reader :employee_id, :hours, :days, :leave_from_date, :leave_to_date, :reason, :status, :pay_element,
                  :pay_element_id, :quantity

      object_attr_reader :leave_balance_type, IpayrollSdk::Models::LeaveBalanceType
    end
  end
end
