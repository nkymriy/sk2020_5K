Rails.application.routes.draw do
  root 'top#index'

  get 'home/index' => "home#index"

  get 'signup/index' => "signs#signup"
  get 'signin/index' => "signs#signin"

  get '/signin/signup/index'=> "signs#signup"

  #以下は臨時のルーティング
  get '/signin/signup/home/index'=>"home#index"
  get '/signin/home/index'=>"home#index"
  get '/signup/home/index'=>"home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
