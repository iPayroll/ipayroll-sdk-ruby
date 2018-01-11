require 'signet/oauth_2/client'
require 'memoizable'

require 'ipayroll-sdk/base/attr_klass_builder'
require 'ipayroll-sdk/base/attr_reader'
require 'ipayroll-sdk/base/resource'
require 'ipayroll-sdk/base/resources'

require 'ipayroll-sdk/errors/authorization_error'
require 'ipayroll-sdk/errors/rest_error'

require 'ipayroll-sdk/http/requester'
require 'ipayroll-sdk/http/response'
require 'ipayroll-sdk/http/signet_http'

require 'ipayroll-sdk/models/access_token'
require 'ipayroll-sdk/models/address'
require 'ipayroll-sdk/models/cost_centre'
require 'ipayroll-sdk/models/custom_field'
require 'ipayroll-sdk/models/employee'
require 'ipayroll-sdk/models/employee_pay_rate'
require 'ipayroll-sdk/models/leave_balance'
require 'ipayroll-sdk/models/leave_balance_type'
require 'ipayroll-sdk/models/leave_entitlement_rule'
require 'ipayroll-sdk/models/leave_request'
require 'ipayroll-sdk/models/link'
require 'ipayroll-sdk/models/page'
require 'ipayroll-sdk/models/pay_element'
require 'ipayroll-sdk/models/pay_element_rate'
require 'ipayroll-sdk/models/payroll'
require 'ipayroll-sdk/models/payroll_pay_frequency'
require 'ipayroll-sdk/models/payslip'
require 'ipayroll-sdk/models/payslip_leave_balance'
require 'ipayroll-sdk/models/payslip_payroll'
require 'ipayroll-sdk/models/payslip_payroll_employee_transaction'
require 'ipayroll-sdk/models/payslip_transaction'
require 'ipayroll-sdk/models/timesheet'
require 'ipayroll-sdk/models/timesheet_transaction'

require 'ipayroll-sdk/utils/Hashable'

require 'ipayroll-sdk/rest/parameters/page'

require 'ipayroll-sdk/rest/requester/create_requester'
require 'ipayroll-sdk/rest/requester/delete_requester'
require 'ipayroll-sdk/rest/requester/get_requester'
require 'ipayroll-sdk/rest/requester/link_requester'
require 'ipayroll-sdk/rest/requester/list_requester'
require 'ipayroll-sdk/rest/requester/update_request'

require 'ipayroll-sdk/rest/cost_centres'
require 'ipayroll-sdk/rest/employee_custom_fields'
require 'ipayroll-sdk/rest/employees'
require 'ipayroll-sdk/rest/employee_leave_balances'
require 'ipayroll-sdk/rest/employee_leave_requests'
require 'ipayroll-sdk/rest/employee_payrates'
require 'ipayroll-sdk/rest/leave_requests'
require 'ipayroll-sdk/rest/oauth2'
require 'ipayroll-sdk/rest/pay_elements'
require 'ipayroll-sdk/rest/payrolls'
require 'ipayroll-sdk/rest/payroll_payslips'
require 'ipayroll-sdk/rest/timesheets'
require 'ipayroll-sdk/rest/timesheet_transactions'

require 'ipayroll-sdk/configuration'
require 'ipayroll-sdk/version'
require 'ipayroll-sdk/client'
