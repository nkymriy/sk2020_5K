Rails.application.routes.draw do
  get 'signup/index'
  get 'signin/index'
  root 'top#index'
  get 'home/index' => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
