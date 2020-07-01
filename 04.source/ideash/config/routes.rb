Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: "users/registrations"
  }
  get 'welcome/index'
  get 'top/index'
  root 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  ##match 'hello' => 'welcome#hello'
end
