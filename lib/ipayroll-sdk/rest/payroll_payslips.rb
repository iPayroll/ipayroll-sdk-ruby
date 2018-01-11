module IpayrollSdk
  module Rest
    class PayrollPayslips
      include IpayrollSdk::Rest::Requester::ListRequester
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client, payroll_id)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::Payslip
        @resource_uri = "/api/v1/payrolls/#{payroll_id}/payslips"
      end

    end
  end
end
