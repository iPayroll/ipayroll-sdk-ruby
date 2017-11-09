module IpayrollSdk
  module Models
    class CustomField < IpayrollSdk::Base::Resource

      attr_reader :category, :categoryName, :customFieldId, :name,
                  :date, :description, :contact, :relationship,
                  :phoneNumber, :email, :address, :contractHours,
                  :periodDays, :contractEnd, :fte, :hayPoints,
                  :haysProfile, :finish, :start, :reportsFrom,
                  :reportsTo, :renumerationType, :annualBenefit,
                  :award

    end
  end
end





