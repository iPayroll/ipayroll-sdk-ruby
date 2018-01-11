# Introduction

The iPayroll Restful Api allows you manipulate some of your iPayroll data through 
third party application. In order to start a quick Java project with iPayroll 
Restful api, we created the iPayroll java sdk project to help you quickly start 
a project to interact with iPayroll Restful API by Java.

## Documentations

All of iPayroll Restful Api documentation can be found at [here](http://dev.ipayroll.co.nz).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipayroll-sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ipayroll_sdk

## Usage

### Configuration

```ruby
client = IpayrollSdk::Client.new(
      :base_url => API_BASE_URL,
      :client_id => '9c502252-b178-440d-b4a9-85e22bdec328',
      :client_secret => 'NaTrce1X02xJ6hs',
      :scope => 'leavebalances payelements payrates leaverequests employees costcentres payslips timesheets',
      :redirect_uri => 'http://localhost:3000/ipayroll/redirect'
  )
```

or

```ruby
IpayrollSdk.configure do |config|
  config.client_id = '9c502252-b178-440d-b4a9-85e22bdec328'
  config.client_secret = 'NaTrce1X02xJ6hs'
  config.scope = 'leavebalances payelements payrates leaverequests employees costcentres payslips timesheets'
  config.redirect_uri = 'http://localhost:3000/ipayroll/redirect'
end

#Then use

client = IpayrollSdk::Client.new
```

### Authentication

#### Oauth2 Authorization code grant
```ruby
def connect
  auth_url = client.oauth2.authorization_url
  redirect_to auth_url
end
```
When the redirect_uri is called with the code parameter
```ruby
@@client.oauth2.exchange_authorization_code_for_access_token(params[:code])
```

refresh the access token

```ruby
client.oauth2.refresh_access_token
```

#### Oauth2 Refresh token grant
```ruby
@@client.oauth2.connect_with_refresh_token('998c625c-719a-4186-bbd0-9200b55bff4c');
```

#### Store access token:
```ruby
class TokenUpdater

  def update(token)
    @token = token
    puts(token)
  end
end
```
```ruby
IpayrollSdk.configure do |config|
  config.client_id = '...'
  config.client_secret = '...'
  config.redirect_uri = '...'
  config.access_token_updater = TokenUpdater.new
end
```

### Request API

#### Get a list of resources
Get the first page
```ruby
client.cost_centres.list
```
Get a specific page
```ruby
pageParameter = IpayrollSdk::Rest::Parameters::Page.new(2, 20)
client.cost_centres.list(pageParameter)
```
#### Get a resource
```ruby
cost_center_id = 7242
client.cost_centres.get(cost_center_id)
```

#### Create resources
```ruby
ccs = [{
  :code => "code12",
  :description => "code1 desc",
  :displayValue => "code1 display"
  }, {
  :code => "code13",
  :description => "code1 desc",
  :displayValue => "code1 display"
}]
@cost_centers = @@client.cost_centres.create(ccs)
```

#### Update a resource
```ruby
employee = @@client.employees.get(141228)
employee.title = SecureRandom.uuid
@updated = @@client.employees.update(employee.id, employee)
```
#### Delete a resource
```ruby
@@client.timesheets.transactions(653972).delete('19');
```

#### All requestable resources
```ruby
@@client.cost_centres
@@client.employees
@@client.employee_custom_fields(employee_id)
@@client.employee_leave_balances(employee_id)
@@client.employee_leave_requests(employee_id)
@@client.employee_payrates(employee_id)
@@client.leave_requests
@@client.pay_elements
@@client.payslips
@@client.timesheets
@@client.timesheetsTransactions($timesheets_id)
@@client.payrolls
```

## Development
Build project: 
```ruby
bundle install
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

