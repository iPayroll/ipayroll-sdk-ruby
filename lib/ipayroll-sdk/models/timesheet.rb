require 'ipayroll-sdk/models/timesheet_transaction'

module IpayrollSdk
  module Models
    class Timesheet < IpayrollSdk::Base::Resource
      attr_reader :employee_id, :days_in_period, :total_hours, :paid_to_date, :paid_from_date, :message

      object_attr_reader :transactions, IpayrollSdk::Models::TimesheetTransaction

    end
  end
end
