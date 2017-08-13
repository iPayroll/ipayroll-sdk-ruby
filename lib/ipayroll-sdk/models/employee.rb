# require 'IpayrollClient/models/external_link'

module IpayrollSdk
  module Models
    class Employee < IpayrollSdk::Base::Resource

      attr_reader :employee_id, :surname, :first_names, :start_date, :birth_date, :paid_to_date, :default_cost_centre, :email, :phone,
                  :title, :work_state, :gender, :pay_frequency, :full_time_hours_week, :organisation, :payment_method

      object_attr_reader :address, IpayrollSdk::Models::Address

    end
  end
end
