Rails.application.routes.draw do

  root :to => "ipayroll#home"

  get 'ipayroll/home'

  get 'ipayroll/home'
  get 'ipayroll/connect'
  get 'ipayroll/redirect'

  get 'ipayroll/withrefreshtoken'
  get 'ipayroll/withaccesstoken'


  get 'ipayroll/costcentres2'
  get 'ipayroll/createcostcentres'
  get 'ipayroll/leaverequests'

  get 'ipayroll/costcentres'
  get 'ipayroll/employees'
  get 'ipayroll/employeeleavebalances'
  get 'ipayroll/employeeleaverequests'
  get 'ipayroll/employeepayrates'
  get 'ipayroll/leaverequests'
  get 'ipayroll/payelements'
  get 'ipayroll/payslips'
  get 'ipayroll/customfields'
  get 'ipayroll/timesheets'
  get 'ipayroll/payrolls'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
