module IpayrollSdk

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    include IpayrollSdk::Utils::Hashable

    attr_accessor :base_url, :authorization_uri, :token_credential_uri, :client_id, :client_secret, :scope,
                  :redirect_uri, :access_token_updater, :auto_refresh, :auto_refresh_count

    def initialize
      @base_url = 'http://secure2.ipayroll.co.nz/'
      @authorization_uri = '/oauth/authorize'
      @token_credential_uri = '/oauth/token'
      @scope = 'leavebalances payelements payrates leaverequests employees costcentres payslips timesheets customfields payrolls'
      @auto_refresh = true
      @auto_refresh_count = 3
      @access_token_updater = TokenUpdater.new()
    end
  end

end