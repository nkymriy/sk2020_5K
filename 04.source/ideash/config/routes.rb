# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        top#index
#                idea_brainstorming_new GET    /idea/brainstorming/new(.:format)                                                        brainstorming#new
#             idea_brainstorming_replay GET    /idea/brainstorming/replay(.:format)                                                     brainstorming#replay
#               idea_brainstorming_edit GET    /idea/brainstorming/edit(.:format)                                                       brainstorming#edit
#                         idea_memo_new GET    /idea/memo/new(.:format)                                                                 memo#new
#                        idea_memo_show GET    /idea/memo/show(.:format)                                                                memo#show
#                        idea_memo_edit GET    /idea/memo/edit(.:format)                                                                memo#edit
#                                  idea GET    /idea(.:format)                                                                          ideas#home
#                             idea_home GET    /idea/home(.:format)                                                                     ideas#home
#                          idea_history GET    /idea/history(.:format)                                                                  ideas#history
#                         idea_category GET    /idea/category(.:format)                                                                 ideas#category
#                      new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#                     new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                       PUT    /users/password(.:format)                                                                devise/passwords#update
#                                       POST   /users/password(.:format)                                                                devise/passwords#create
#              cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#                 new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#                edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#                     user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                                       PUT    /users(.:format)                                                                         devise/registrations#update
#                                       DELETE /users(.:format)                                                                         devise/registrations#destroy
#                                       POST   /users(.:format)                                                                         devise/registrations#create
#                 new_user_confirmation GET    /users/confirmation/new(.:format)                                                        users/confirmations#new
#                     user_confirmation GET    /users/confirmation(.:format)                                                            users/confirmations#show
#                                       POST   /users/confirmation(.:format)                                                            users/confirmations#create
#                       new_user_unlock GET    /users/unlock/new(.:format)                                                              devise/unlocks#new
#                           user_unlock GET    /users/unlock(.:format)                                                                  devise/unlocks#show
#                                       POST   /users/unlock(.:format)                                                                  devise/unlocks#create
#                        account_signin GET    /account/signin(.:format)                                                                users/sessions#new
#                                       POST   /account/signin(.:format)                                                                users/sessions#create
#                        account_signup GET    /account/signup(.:format)                                                                users/registrations#new
#                                       POST   /account/signup(.:format)                                                                users/registrations#create
#                       account_signout GET    /account/signout(.:format)                                                               users/sessions#destroy
#                  account_profile_edit GET    /account/profile_edit(.:format)                                                          account#profile_edit
#                          dbtest_index GET    /dbtest(.:format)                                                                        dbtest#index
#                                       POST   /dbtest(.:format)                                                                        dbtest#create
#                            new_dbtest GET    /dbtest/new(.:format)                                                                    dbtest#new
#                           edit_dbtest GET    /dbtest/:id/edit(.:format)                                                               dbtest#edit
#                                dbtest GET    /dbtest/:id(.:format)                                                                    dbtest#show
#                                       PATCH  /dbtest/:id(.:format)                                                                    dbtest#update
#                                       PUT    /dbtest/:id(.:format)                                                                    dbtest#update
#                                       DELETE /dbtest/:id(.:format)                                                                    dbtest#destroy
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
  root 'top#index'

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

  devise_for :users, controllers: {
          # registrations: "users/registrations",
      #     passwords: 'users/passwords',
      confirmations: 'users/confirmations',
      #     sessions: 'users/sessions',
  }
  # devise_for :users, skip: :all
  devise_scope :user do
    get 'account/signin' => 'users/sessions#new'
    post 'account/signin' => 'users/sessions#create'
    get 'account/signup' => 'users/registrations#new'
    post 'account/signup' => 'users/registrations#create'
    get 'account/signout' => 'users/sessions#destroy'
    get 'account/profile_edit' => 'users/edit'
    # get 'users' => 'users/registrations#index'
  end

  resources :dbtest
  # resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
