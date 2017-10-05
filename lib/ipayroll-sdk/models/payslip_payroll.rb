module IpayrollSdk
  module Models

    class PayslipPayroll < IpayrollSdk::Base::AttrReader

      attr_reader :payroll_number, :pay_date, :message

    end
  end
end