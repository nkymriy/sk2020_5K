Rails.application.routes.draw do

  root 'top#index'
  get 'top/index'=>"top#index"

  get 'home/index' => "home#index"

  get 'signup/index' => "signs#signup"
  get 'signin/index' => "signs#signin"

  get '/signin/signup/index'=> "signs#signup"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
