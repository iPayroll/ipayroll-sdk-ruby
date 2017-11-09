# require 'IpayrollClient/models/external_link'

module IpayrollSdk
  module Models
    class Employee < IpayrollSdk::Base::Resource

      attr_reader :surname, :first_names, :start_date, :birth_date, :paid_to_date, :default_cost_centre,
                  :email, :phone, :title, :work_state, :gender, :pay_frequency, :full_time_hours_week, :organisation,
                  :payment_method, :bank_account_number, :tax_number, :finish_date, :termination_reason, :tax_code, :tax_scale,
                  :kiwi_saver_rate, :employer_subsidy, :kiwi_saver_opt_out_date, :existing_kiwi_saver_member,
                  :death_benefit_surname, :death_benefit_first_name, :death_benefit_recipient, :esct_rate, :special_tax,
                  :special_earner_levy, :special_extra_pay_rate, :special_student_loan, :user_defined_group, :is_help_debt,
                  :is_medicare_levy_variation_declaration, :has_spouse, :income_less_than_relevant_amount,
                  :payroll_tax_exempt, :sfss_debt, :dependent_children, :surcharge_increase, :preferred_name,
                  :proprietor_status, :contractors_abn


      object_attr_reader :address, IpayrollSdk::Models::Address

    end
  end
end
