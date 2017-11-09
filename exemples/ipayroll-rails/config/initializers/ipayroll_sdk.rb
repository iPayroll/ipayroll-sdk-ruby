IpayrollSdk.configure do |config|
  config.base_url = 'http://localhost:8080/ipayroll'

  config.client_id = 'd908376c-3d1b-41a9-8358-1fad946e0c57'
  config.client_secret = 'GwUmPqD8s7mGj4d'
  config.scope = 'leavebalances payelements payrates leaverequests employees costcentres payslips timesheets customfields'
  config.redirect_uri = 'http://localhost:3000/ipayroll/redirect'
  config.access_token_updater = TokenUpdater.new()
end