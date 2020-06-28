Rails.application.routes.draw do
  get 'account/signin' => 'users#signin'
  get 'account/signup' => 'users#signup'
  get 'account/signout' =>'users#singout'
  get 'account/profile_edit' =>'users#edit'
  get 'top/index'
  root 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
