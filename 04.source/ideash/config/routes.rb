Rails.application.routes.draw do
  get 'top/index'
  root 'top#index'

  get 'dbtest/callertest'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
