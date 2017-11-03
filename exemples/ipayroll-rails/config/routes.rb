Rails.application.routes.draw do

  root :to => "ipayroll#home"

  get 'ipayroll/home'

  get 'ipayroll/home'
  get 'ipayroll/connect'
  get 'ipayroll/redirect'

  get 'ipayroll/withrefreshtoken'
  get 'ipayroll/withaccesstoken'

  get 'ipayroll/costcentres'
  get 'ipayroll/costcentres2'
  get 'ipayroll/createcostcentres'
  get 'ipayroll/leaverequests'

  get 'ipayroll/employees'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
