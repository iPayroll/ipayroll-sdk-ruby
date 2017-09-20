IpayrollSdk.configure do |config|
  config.base_url = 'http://localhost:8080/ipayroll'

  config.client_id = '632a0a7c-713d-4646-a18d-0d85fbc1b33b'
  config.client_secret = 'fIwBQNlpxS24ywE'
  config.scope = 'leavebalances payelements payrates leaverequests employees costcentres payslips timesheets'
  config.redirect_uri = 'http://localhost:3000/ipayroll/redirect'

end