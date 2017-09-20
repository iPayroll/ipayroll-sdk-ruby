require 'ipayroll-sdk/models/pay_element_rate'

module IpayrollSdk
  module Models
    class PayElement < IpayrollSdk::Base::Resource


      attr_reader :code, :description, :display_value, :calculation_rule,
                  :group, :type, :multiplier, :rate_amount, :expired,
                  :is_acc_levy_liable, :is_superable_earning, :is_holiday_pay_liable, :is_not_kiwi_saver_liable, :is_payroll_tax_liable,
                  :is_rdo_liable, :is_lsl_liable, :is_cas_liable, :is_reducing, :is_rayable_on_final_pay,
                  :is_itemised_on_payment_summary, :allow_partial_deduction, :consolidate_transactions, :payee_reference, :payee_code,
                  :bank_account_number, :bsb_account_number, :reduce_superable, :priority,

                  :cost_centres_rule, :payment_method, :payee_particulars, :donee_address,
                  :donee_name, :is_unused_leave_payment, :is_employment_termination_payment, :is_employment_termination_payment_no_lump_d,
                  :available_for_leave_request, :leave_tax_type, :payment_group, :calculation_accumulator,
                  :debit_cost_centre_rule, :excess_redundancy, :custom_field

      object_attr_reader :leave_balance_type, IpayrollSdk::Models::LeaveBalanceType
      object_attr_reader :rules, IpayrollSdk::Models::LeaveEntitlementRule
      object_attr_reader :rates, IpayrollSdk::Models::PayElementRate


    end

  end
end