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

  def costcentres2
    @@client.oauth2.refresh_access_token()
    pageParameter = IpayrollSdk::Rest::Parameters::Page.new(2, 20)
    @cost_centers_collection = @@client.cost_centres.list(pageParameter)
  end

  def employees
    @collection = @@client.employees.list
    @collection = @@client.employees.link_resources(@collection.next_page)
    @resource = @@client.employees.get(141228)
    update_employee @resource
    render_resource
  end

  def costcentres
    @collection = @@client.cost_centres.list
    @resource = @@client.cost_centres.get(7074)
    create_cost_centres
    render_resource
  end

  def employeeleavebalances
    @collection = @@client.employee_leave_balances(654024).list
    @resource = @@client.employee_leave_balances(654024).get('Annual Leave')
    render_resource
  end

  def employeeleaverequests
    @collection = @@client.employee_leave_requests(654024).list
    @resource = @@client.employee_leave_requests(654024).get(5112)
    @outstanding = @@client.employee_leave_requests(654024).list_outstanding
    render_resource
  end


  def employeepayrates
    @collection = @@client.employee_payrates(654024).list
    @resource = @@client.employee_payrates(654024).get(1)

    render_resource
  end

  def leaverequests
    @collection = @@client.leave_requests.list
    @resource = @@client.leave_requests.get(5112)
    @outstanding = @@client.leave_requests.list_outstanding
    render_resource
  end

  def payelements
    @collection = @@client.pay_elements.list
    @resource = @@client.pay_elements.get('AAA')
    render_resource
  end

  def payslips
    @collection = @@client.payslips.list
    @outstanding = @@client.payslips.list_by_payroll('0130')
    @resource = @@client.payslips.get_by_employee_id('977659')
    @resource2 = @@client.payslips.get_by_payroll_and_by_employee_id('0130', '977659')
    render_resource
  end

  def customfields
    @collection = @@client.custom_fields(109).list
    @outstanding = @@client.custom_fields(109).list_by_category('6')
    @resource = @@client.custom_fields(109).get_by_category_and_id('6', '6586')
    render_resource
  end



  def update_employee(resource)
    resource.title = SecureRandom.uuid
    @updated = @@client.employees.update(@resource.id, resource)
  end

  def create_cost_centres
    ccs = [{
               :code => "code12" + SecureRandom.uuid,
               :description => "code1 desc",
               :displayValue => "code1 display"
           },
           {
               :code => "code13" + SecureRandom.uuid,
               :description => "code1 desc",
               :displayValue => "code1 display"
           }
    ]
    @created = @@client.cost_centres.create(ccs)
  end

  # @@client = IpayrollSdk::Client.new(
  #     :base_url => "http://localhost:8080/ipayroll",
  #     :client_id => '9c502252-b178-440d-b4a9-85e22bdec328',
  #     :client_secret => 'NaTrce1X02xJ6hs',
  #     :redirect_uri => 'http://localhost:3000/ipayroll/redirect'
  # )


  @@client = IpayrollSdk::Client.new

  private
  def render_resource
    render 'ipayroll/resource'
  end


end
