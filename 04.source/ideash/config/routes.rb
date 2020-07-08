Rails.application.routes.draw do
  root 'brainstorming#new'

  get 'idea/brainstorming/new' => 'brainstorming#new'
  get 'idea/brainstorming/replay' => 'brainstorming#replay'
  get 'idea/brainstorming/edit' => 'brainstorming#edit'

  get 'idea/memo/new' => 'memo#new'
  get 'idea/memo/show' => 'memo#show'
  get 'idea/memo/edit' => 'memo#edit'

  get 'idea' => 'ideas#home'
  get 'idea/home' => 'ideas#home'
  get 'idea/history' => 'ideas#history'
  get 'idea/category' => 'ideas#category'

  get 'account/signin' => 'users#signin'
  get 'account/signup' => 'users#signup'
  get 'account/signout' =>'users#singout'
  get 'account/profile_edit' =>'users#edit'

  resources :dbtest
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
