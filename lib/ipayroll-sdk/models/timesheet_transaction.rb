module IpayrollSdk
  module Models
    class TimesheetTransaction < IpayrollSdk::Base::Resource

      attr_reader :timesheet_transaction_id, :amount, :quantity, :rate,
                  :description, :cost_centre, :reason, :leave_from,
                  :leave_to, :leave_days, :pay_element

    end
  end
end