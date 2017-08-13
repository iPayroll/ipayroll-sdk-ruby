# require 'ipayroll-sdk/base/resource'

module IpayrollSdk
  module Models
    class Timesheet < IpayrollSdk::Base::Resource
      attr_reader :employee_id, :days_in_period, :total_hours, :timesheet_transaction

    end
  end
end
