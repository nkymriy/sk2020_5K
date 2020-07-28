# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        top#index
#                        account_signin GET    /account/signin(.:format)                                                                users/sessions#new
#                                       POST   /account/signin(.:format)                                                                users/sessions#create
#                        account_signup GET    /account/signup(.:format)                                                                users/registrations#new
#                                       POST   /account/signup(.:format)                                                                users/registrations#create
#                       account_signout GET    /account/signout(.:format)                                                               users/sessions#destroy
#                  account_profile_edit GET    /account/profile_edit(.:format)                                                          account#profile_edit
#                     user_confirmation GET    /user/confirmation(.:format)                                                             users/confirmations#show
#                                       POST   /user/confirmation(.:format)                                                             users/confirmations#create
#                                  idea GET    /idea(.:format)                                                                          ideas#home
#                             idea_home GET    /idea/home(.:format)                                                                     ideas#home
#                          idea_history GET    /idea/history(.:format)                                                                  ideas#history
#                         idea_category GET    /idea/category(.:format)                                                                 ideas#category
#                         idea_memo_new GET    /idea/memo/new(.:format)                                                                 memo#new
#                                       POST   /idea/memo/new(.:format)                                                                 memo#new
#                             idea_memo POST   /idea/memo(.:format)                                                                     memo#create
#                                       GET    /idea/memo/edit/:id(.:format)                                                            memo#edit
#                                       PATCH  /idea/memo(.:format)                                                                     memo#update
#                idea_brainstorming_new GET    /idea/brainstorming/new(.:format)                                                        brainstorming#new
#             idea_brainstorming_replay GET    /idea/brainstorming/replay(.:format)                                                     brainstorming#replay
#             idea_brainstorming_create POST   /idea/brainstorming/create(.:format)                                                     brainstorming#create
#               idea_brainstorming_edit GET    /idea/brainstorming/edit/:id(.:format)                                                   brainstorming#edit
#                     jquery_test_index GET    /jquery_test/index(.:format)                                                             jquery_test#index
#                                              /cable                                                                                   #<ActionCable::Server::Base:0x0000564d50041ac0 @config=#<ActionCable::Server::Configuration:0x0000564d501c8380 @log_tags=[], @connection_class=#<Proc:0x0000564d501828a8 /home/otyua/RubymineProjects/sk2020_5K/04.source/ideash/vendor/bundle/ruby/2.7.0/gems/actioncable-6.0.3.1/lib/action_cable/engine.rb:37 (lambda)>, @worker_pool_size=4, @disable_request_forgery_protection=false, @allow_same_origin_as_host=true, @logger=#<ActiveSupport::Logger:0x0000564d4da3c758 @level=0, @progname=nil, @default_formatter=#<Logger::Formatter:0x0000564d4da3cb18 @datetime_format=nil>, @formatter=#<ActiveSupport::Logger::SimpleFormatter:0x0000564d4da3c668 @datetime_format=nil, @thread_key="activesupport_tagged_logging_tags:18480">, @logdev=#<Logger::LogDevice:0x0000564d4da3cac8 @shift_period_suffix="%Y%m%d", @shift_size=1048576, @shift_age=0, @filename="/home/otyua/RubymineProjects/sk2020_5K/04.source/ideash/log/development.log", @dev=#<File:/home/otyua/RubymineProjects/sk2020_5K/04.source/ideash/log/development.log>, @binmode=false, @mon_data=#<Monitor:0x0000564d4da3ca00>, @mon_data_owner_object_id=14040>>, @cable={"adapter"=>"async"}, @mount_path="/cable", @allowed_request_origins=/https?:\/\/localhost:\d+/>, @mutex=#<Monitor:0x0000564d50041a70>, @pubsub=nil, @worker_pool=nil, @event_loop=nil, @remote_connections=nil>
#                              ideachat GET    /ideachat(.:format)                                                                      ideachat#index
#                         ideachat_show GET    /ideachat/:id(.:format)                                                                  ideachat#show
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # トップページ
  root 'top#index'
  get '/releasenote' => 'top#releasenote'


  # devise(ユーザ認証関連)
  devise_for :users, skip: :all
  devise_scope :user do
    get 'account/signin' => 'users/sessions#new'
    post 'account/signin' => 'users/sessions#create'
    get 'account/signup' => 'users/registrations#new'
    post 'account/signup' => 'users/registrations#create'
    get 'account/signout' => 'users/sessions#destroy'
    get 'account/profile_edit' => 'users/edit'
    # get 'user/confirmation/new' => 'users/confirmations#new'
    get 'user/confirmation' => 'users/confirmations#show'
    post 'user/confirmation' => 'users/confirmations#create'
  end

  # ユーザのホーム画面
  get 'idea' => 'ideas#home'
  # get 'idea' => 'memo#new'
  get 'idea/home' => 'ideas#home'
  get 'idea/history' => 'ideas#history'
  get 'idea/category' => 'ideas#category'

  # メモ
  get 'idea/memo/new' => 'memo#new'
  post 'idea/memo/new' => 'memo#new'
  post 'idea/memo' => 'memo#create'
  # get 'idea/memo/show' => 'memo#show'
  get 'idea/memo/edit/:id' => 'memo#edit'
  patch '/idea/memo' => 'memo#update'


  # ブレインストーミング
  get 'idea/brainstorming/new' => 'brainstorming#new'
  get 'idea/brainstorming/replay' => 'brainstorming#replay'
  post 'idea/brainstorming/create' => 'brainstorming#create'
  get 'idea/brainstorming/edit/:id' => 'brainstorming#edit', as: :idea_brainstorming_edit

  # developmentモードでのみ以下のルーティングが行われる
  if Rails.env.development?
    # 仲 メモのindexによる一覧表示のテスト用
    # get 'idea/memo' => 'memo#index'
    # DBのテスト用
    # resources :dbtest
    # resources :users
    get 'jquery_test/index'

    # 仲 ideachatのテスト用ルーティング
    # get 'ideachat/show' => 'ideachat#show'
    # Action Cableを有効化する
    mount ActionCable.server => '/cable'
    # resources :ideas, only: %i[show]
    get 'ideachat/' => 'ideachat#index'
    get 'ideachat/:id' => 'ideachat#show', as: :ideachat_show
    # 仲 ここまでテスト用ルーティング
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
