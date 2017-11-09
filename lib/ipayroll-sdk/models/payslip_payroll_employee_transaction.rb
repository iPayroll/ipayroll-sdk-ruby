module IpayrollSdk
  module Models
    class PayslipPayrollEmployeeTransaction < IpayrollSdk::Base::AttrReader
      attr_reader :amount, :quantity, :charity, :description, :notes, :display_payslip_quantity
    end
  end
end