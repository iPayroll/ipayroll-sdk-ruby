module IpayrollSdk
  class Client

    API_BASE_URL_DEFAULT = "http://secure2.ipayroll.co.nz/"
    AUTHORIZATION_URI_DEFAULT = "/oauth/authorize"
    TOKEN_CREDENTIAL_URI_DEFAULT = "/oauth/token"

    attr_accessor :base_url
    attr_writer :user_agent

    def initialize(options = {})
      options = IpayrollSdk.configuration.to_hash.merge(options)
      @base_url = options[:base_url]
      @rest_client = init_signet_client(options)
    end

    def is_connected
      oauth2.is_connected
    end

    def oauth2
      IpayrollSdk::Rest::Oauth2.new(@rest_client)
    end

    def cost_centres
      IpayrollSdk::Rest::CostCentres.new(@rest_client)
    end

    def employees
      IpayrollSdk::Rest::Employees.new(@rest_client)
    end

    def employee_payrates(employee_id)
      IpayrollSdk::Rest::EmployeePayrates.new(@rest_client, employee_id)
    end

    def employee_leave_balances(employee_id)
      IpayrollSdk::Rest::EmployeeLeaveBalances.new(@rest_client, employee_id)
    end

    def employee_leave_requests(employee_id)
      IpayrollSdk::Rest::EmployeeLeaveRequests.new(@rest_client, employee_id)
    end

    def leave_requests
      IpayrollSdk::Rest::LeaveRequests.new(@rest_client)
    end

    def pay_elements
      IpayrollSdk::Rest::PayElements.new(@rest_client)
    end

    def payslips
      IpayrollSdk::Rest::Payslips.new(@rest_client)
    end

    def custom_fields(employee_id)
      IpayrollSdk::Rest::CustomFields.new(@rest_client, employee_id)
    end

    def timesheets
      return IpayrollSdk::Rest::Timesheets.new(@rest_client);
    end

    def timesheets_transactions(timesheet_id)
      return IpayrollSdk::Rest::TimesheetsTransactions.new(@rest_client, timesheet_id);
    end

    def payrolls
      return IpayrollSdk::Rest::Payrolls.new(@rest_client);
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
              :redirect_uri => options[:redirect_uri],
              :access_token_updater => options[:access_token_updater],
              :auto_refresh => options[:auto_refresh],
              :auto_refresh_count => options[:auto_refresh_count]
          }
      )
    end

  end
end