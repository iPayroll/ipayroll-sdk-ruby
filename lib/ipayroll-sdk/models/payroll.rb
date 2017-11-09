require 'ipayroll-sdk/models/payroll_pay_frequency'

module IpayrollSdk
  module Models
    class Payroll < IpayrollSdk::Base::Resource
      attr_reader :payroll_number, :pay_date, :message, :status, :payroll_type

      object_attr_reader :payFrequencies, IpayrollSdk::Models::PayrollPayFrequency

    end
  end
end
