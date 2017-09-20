require 'ipayroll-sdk/models/payslip_transaction'
require 'ipayroll-sdk/models/payslip_leave_balance'
require 'ipayroll-sdk/models/payslip_payroll_employee_transaction'
require 'ipayroll-sdk/models/timesheet'
require 'ipayroll-sdk/models/payslip_payroll'

module IpayrollSdk
  module Models
    class Payslip < IpayrollSdk::Base::Resource

      # private Map<String, BigDecimal> yearToDateTotals;


      attr_reader :total_payments, :overpayment, :tax_credit, :year_to_date_totals, :nett_pay, :abn, :payslip_message

      object_attr_reader :deductions, IpayrollSdk::Models::PayslipPayrollEmployeeTransaction
      object_attr_reader :other_benefits,  IpayrollSdk::Models::PayslipPayrollEmployeeTransaction
      object_attr_reader :leave_balances, IpayrollSdk::Models::PayslipLeaveBalance
      object_attr_reader :timesheet, IpayrollSdk::Models::Timesheet
      object_attr_reader :payments, IpayrollSdk::Models::PayslipTransaction
      object_attr_reader :payroll, IpayrollSdk::Models::PayslipPayroll


    end
  end
end
