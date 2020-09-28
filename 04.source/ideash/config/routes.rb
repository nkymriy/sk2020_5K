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
  # INFO: トップページ
  root 'top#index'
  get 'release_note' => 'top#release_note'


  # INFO: devise(ユーザ認証関連)
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

  # INFO: ユーザのホーム画面
  get 'idea' => 'ideas#home'
  get 'idea/home' => 'ideas#home'
  get 'idea/history' => 'ideas#history'
  get 'idea/category' => 'ideas#category'
  get 'idea/account' => 'ideas#account'

  # INFO: メモ
  get 'idea/memo/new' => 'memo#new'
  post 'idea/memo/new' => 'memo#new'
  post 'idea/memo' => 'memo#create'
  # get 'idea/memo/show' => 'memo#show'
  get 'idea/memo/edit/:id' => 'memo#edit'
  patch '/idea/memo' => 'memo#update'

  # INFO: ブレインストーミング
  get 'idea/brainstorming/new' => 'brainstorming#new'
  get 'idea/brainstorming/replay' => 'brainstorming#replay'
  post 'idea/brainstorming/create' => 'brainstorming#create'
  get 'idea/brainstorming/edit/:id' => 'brainstorming#edit', as: :idea_brainstorming_edit

  # NOTE: Action Cable の有効化
  mount ActionCable.server => '/cable'
  # developmentモードでのみ以下のルーティングが行われる
  if Rails.env.development?
    # NOTE: jQueryのテスト用
    get 'jquery_test/index'
    # NOTE: WebSocketのテスト用チャット画面
    get 'ideachat/' => 'ideachat#index'
    get 'ideachat/:id' => 'ideachat#show', as: :ideachat_show
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
