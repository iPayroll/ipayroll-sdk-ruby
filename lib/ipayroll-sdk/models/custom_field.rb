module IpayrollSdk
  module Models
    class CustomField < IpayrollSdk::Base::Resource

      attr_reader :category, :category_name, :custom_field_id, :name,
                  :date, :description, :contact, :relationship,
                  :phone_number, :email, :address, :contract_hours,
                  :period_days, :contract_end, :fte, :hay_points,
                  :hays_profile, :finish, :start, :reports_from,
                  :reports_to, :renumeration_type, :annual_benefit,
                  :award

    end
  end
end





