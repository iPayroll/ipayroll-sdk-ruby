require 'ipayroll-sdk'

class IpayrollController < ApplicationController

  def home
    @is_connected = @@client.is_connected
  end

  def connect
    auth_url = @@client.oauth2.authorization_url
    redirect_to auth_url
  end

  def withrefreshtoken
    @token = @@client.oauth2.connect_with_refresh_token('998c625c-719a-4186-bbd0-9200b55bff4c');
    redirect_to url_for(:controller => :ipayroll, :action => :home)
  end

  def withaccesstoken
    @token = IpayrollSdk::Models::AccessToken.new(
        'access_token' => 'b8f6114b-f653-4fc1-b15a-b916ead476f2',
        'token_type' => 'bearer',
        'refresh_token' => '998c625c-719a-4186-bbd0-9200b55bff4c',
        'expires_in' => '599',
        'scope' => 'payelements timesheets leaverequests payrates payslips leavebalances employees costcentres'
    )

    @token = @@client.oauth2.connect_with_access_token(@token);
    redirect_to url_for(:controller => :ipayroll, :action => :home)
  end

  def redirect
    @token = @@client.oauth2.exchange_authorization_code_for_access_token(params[:code])
    redirect_to url_for(:controller => :ipayroll, :action => :home)
  end

  def costcentres
    @cost_centers_collection = @@client.cost_centres.list
    # @cost_centers_collection2 = @@client.cost_centres.link_resources(@cost_centers_collection.next_page)
    @cost_center = @@client.cost_centres.get(77069)
  end

  def costcentres2
    @@client.oauth2.refresh_access_token()
    pageParameter = IpayrollSdk::Rest::Parameters::Page.new(2, 20)
    @cost_centers_collection = @@client.cost_centres.list(pageParameter)
  end

  def employees
    @employees_collection = @@client.employees.list
    @employees_collection = @@client.employees.link_resources(@employees_collection.next_page)

    @payrates = @@client.employees_payrates(141228).list
    @employee = @@client.employees.get(141228)
    @employee
  end

  def leaverequests
    @leave_requests_collection = @@client.leave_requests.list
    @leave_requests_outstanding_collection = @@client.leave_requests.list_outstanding
  end

  def createcostcentres
    ccs = [{
               :code => "code12",
               :description => "code1 desc",
               :displayValue => "code1 display"
           },
           {
               :code => "code13",
               :description => "code1 desc",
               :displayValue => "code1 display"
           }
    ]
    @cost_centers = @@client.cost_centres.create(ccs)
  end

  # @@client = IpayrollSdk::Client.new(
  #     :base_url => "http://localhost:8080/ipayroll",
  #     :client_id => '9c502252-b178-440d-b4a9-85e22bdec328',
  #     :client_secret => 'NaTrce1X02xJ6hs',
  #     :redirect_uri => 'http://localhost:3000/ipayroll/redirect'
  # )

  @@client = IpayrollSdk::Client.new

end
