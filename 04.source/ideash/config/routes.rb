Rails.application.routes.draw do
  root 'top#index'

  get 'idea' => 'ideas#home'
  get 'idea/home' => 'ideas#home'
  get 'idea/history' => 'ideas#history'
  get 'idea/category' => 'ideas#category'
  get 'account/signin' => 'users#signin'
  get 'account/signup' => 'users#signup'
  get 'account/signout' =>'users#singout'
  get 'account/profile_edit' =>'users#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
