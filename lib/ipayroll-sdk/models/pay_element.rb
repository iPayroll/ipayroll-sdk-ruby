require 'ipayroll-sdk/models/pay_element_rate'

module IpayrollSdk
  module Models
    class PayElement < IpayrollSdk::Base::Resource


      attr_reader :code, :description, :display_value, :calculation_rule,
                  :group, :type, :multiplier, :rate_amount, :expired,
                  :acc_levy_liable, :superable_earning, :holiday_pay_liable, :not_kiwi_saver_liable, :payroll_tax_liable,
                  :rdo_liable, :lsl_liable, :cas_liable, :reducing, :payable_on_final_pay,
                  :itemised_on_payment_summary, :allow_partial_deduction, :consolidate_transactions, :payee_reference, :payee_code,
                  :bank_account_number, :bsb_account_number, :reduce_superable, :priority,
                  :cost_centres_rule, :payment_method, :payee_particulars, :donee_address,
                  :donee_name, :unused_leave_payment, :employment_termination_payment, :employment_termination_payment_no_lump_d,
                  :available_for_leave_request, :leave_tax_type, :payment_group, :calculation_accumulator,
                  :debit_cost_centre_rule, :excess_redundancy, :derived_from, :custom_field

      object_attr_reader :leave_balance_type, IpayrollSdk::Models::LeaveBalanceType
      object_attr_reader :rules, IpayrollSdk::Models::LeaveEntitlementRule
      object_attr_reader :rates, IpayrollSdk::Models::PayElementRate


    end

  end
end