module IpayrollSdk
  module Models
    class LeaveRequest < IpayrollSdk::Base::Resource

      attr_reader :employee_id, :request_id, :hours, :days, :leave_from_date, :leave_to_date, :reason, :status, :pay_element

      object_attr_reader :leave_balance_type, IpayrollSdk::Models::LeaveBalanceType
    end
  end
end
