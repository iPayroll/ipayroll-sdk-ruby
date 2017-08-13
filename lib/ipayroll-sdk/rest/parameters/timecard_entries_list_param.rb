module IpayrollSdk
  module Rest
    module Parameters
      class TimecardEntriesListParam
        include IpayrollSdk::Utils::Hashable

        attr_writer :employeeId, :startTime, :endTime, :activityId, :status

      end
    end
  end
end