module IpayrollSdk
  module Models
    class TimecardEntry < IpayrollSdk::Base::Resource

      attr_reader :id, :date, :start_time, :end_time,
                  :status, :hours, :version, :linked_resource_id,
                  :is_created_by_kiosk, :kiosk_note, :approver_note, :break_minutes


      object_attr_reader :employee, :createdBy, IpayrollSdk::Models::TimecardEmployee
      object_attr_reader :activity, IpayrollSdk::Models::TimecardActivity


    end
  end
end
