module IpayrollSdk
  class Client

    API_BASE_URL_DEFAULT = "http://secure2.ipayroll.co.nz/"
    AUTHORIZATION_URI_DEFAULT = "/oauth/authorize"
    TOKEN_CREDENTIAL_URI_DEFAULT = "/oauth/token"

    attr_accessor :base_url
    attr_writer :user_agent

    def initialize(options={})
      options = IpayrollSdk.configuration.to_hash.merge(options)
      @base_url = options[:base_url]
      @restClient = init_signet_client(options)
    end

    def is_connected
      oauth2.is_connected
    end

    def oauth2
      IpayrollSdk::Rest::Oauth2.new(@restClient)
    end

    def cost_centres
      IpayrollSdk::Rest::CostCentres.new(@restClient)
    end

    def employees
      IpayrollSdk::Rest::Employees.new(@restClient)
    end

    def employees_payrates(employee_id)
      IpayrollSdk::Rest::EmployeesPayrates.new(@restClient, employee_id)
    end

    def employees_leave_balances(employee_id)
      IpayrollSdk::Rest::EmployeesLeaveBalances.new(@restClient, employee_id)
    end

    def employees_leave_requests(employee_id)
      IpayrollSdk::Rest::EmployeesLeaveRequests.new(@restClient, employee_id)
    end

    def employees_payslips(employee_id)
      IpayrollSdk::Rest::EmployeesLeaveRequests.new(@restClient, employee_id)
    end

    def leave_requests
      IpayrollSdk::Rest::LeaveRequests.new(@restClient)
    end

    def pay_elements
      IpayrollSdk::Rest::PayElements.new(@restClient)
    end

    def payslips
      IpayrollSdk::Rest::Payslips.new(@restClient)
    end

    def timecard_entries
      IpayrollSdk::Rest::TimecardEntries.new(@restClient)
    end

    private

    def init_signet_client(options)
      IpayrollSdk::Http::SignetHttp.new(
          {
              :base_url => options[:base_url],
              :authorization_uri => options[:base_url] + options[:authorization_uri],
              :token_credential_uri => options[:base_url] + options[:token_credential_uri],
              :client_id => options[:client_id],
              :client_secret => options[:client_secret],
              :scope => options[:scope],
              :redirect_uri => options[:redirect_uri]
          }
      )
    end


  end
end