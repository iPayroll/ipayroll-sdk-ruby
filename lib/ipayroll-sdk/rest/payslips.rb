module IpayrollSdk
  module Internal
    class Payslips
      include IpayrollSdk::Rest::Requester::GetRequester
      include IpayrollSdk::Rest::Requester::LinkRequester

      def initialize(rest_client)
        @requester = rest_client.requester
        @resource_clazz = IpayrollSdk::Models::Payslip
        @resource_uri = "/api/v1/payslips/"
      end

      # /api/v1/payslips/{payrollNumber}/employees/{employeeId}
      # # T getAllByEmployee(String employeeId, String payrollNumber);
      #
      # /api/v1/payslips/{payrollNumber}
      # # PagedResources<T> getAllByPayrollNumber(String payrollNumber, Pageable pageable);

    end
  end
end
