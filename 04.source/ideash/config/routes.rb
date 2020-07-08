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
#                      new_user_session GET    /users/sign_in(.:format)                                                                 sessions#new
#                          user_session POST   /users/sign_in(.:format)                                                                 sessions#create
#                  destroy_user_session DELETE /users/sign_out(.:format)                                                                sessions#destroy
#                     new_user_password GET    /users/password/new(.:format)                                                            passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)                                                           passwords#edit
#                         user_password PATCH  /users/password(.:format)                                                                passwords#update
#                                       PUT    /users/password(.:format)                                                                passwords#update
#                                       POST   /users/password(.:format)                                                                passwords#create
#              cancel_user_registration GET    /users/cancel(.:format)                                                                  registrations#cancel
#                 new_user_registration GET    /users/sign_up(.:format)                                                                 registrations#new
#                edit_user_registration GET    /users/edit(.:format)                                                                    registrations#edit
#                     user_registration PATCH  /users(.:format)                                                                         registrations#update
#                                       PUT    /users(.:format)                                                                         registrations#update
#                                       DELETE /users(.:format)                                                                         registrations#destroy
#                                       POST   /users(.:format)                                                                         registrations#create
#                 new_user_confirmation GET    /users/confirmation/new(.:format)                                                        confirmations#new
#                     user_confirmation GET    /users/confirmation(.:format)                                                            confirmations#show
#                                       POST   /users/confirmation(.:format)                                                            confirmations#create
#                       new_user_unlock GET    /users/unlock/new(.:format)                                                              devise/unlocks#new
#                           user_unlock GET    /users/unlock(.:format)                                                                  devise/unlocks#show
#                                       POST   /users/unlock(.:format)                                                                  devise/unlocks#create
#                          dbtest_index GET    /dbtest(.:format)                                                                        dbtest#index
#                                       POST   /dbtest(.:format)                                                                        dbtest#create
#                            new_dbtest GET    /dbtest/new(.:format)                                                                    dbtest#new
#                           edit_dbtest GET    /dbtest/:id/edit(.:format)                                                               dbtest#edit
#                                dbtest GET    /dbtest/:id(.:format)                                                                    dbtest#show
#                                       PATCH  /dbtest/:id(.:format)                                                                    dbtest#update
#                                       PUT    /dbtest/:id(.:format)                                                                    dbtest#update
#                                       DELETE /dbtest/:id(.:format)                                                                    dbtest#destroy
#                                 users GET    /users(.:format)                                                                         users#index
#                                       POST   /users(.:format)                                                                         users#create
#                              new_user GET    /users/new(.:format)                                                                     users#new
#                             edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                                  user GET    /users/:id(.:format)                                                                     users#show
#                                       PATCH  /users/:id(.:format)                                                                     users#update
#                                       PUT    /users/:id(.:format)                                                                     users#update
#                                       DELETE /users/:id(.:format)                                                                     users#destroy
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
      #     registrations: "users/registrations",
      #     passwords: 'users/passwords',
      confirmations: 'users/confirmations',
      #     sessions: 'users/sessions',
  }
  devise_for :users, skip: :all
  devise_scope :user do
    get 'account/signin' => 'users/sessions#new'
    post 'account/signin' => 'users/sessions#create'
    get 'account/signup' => 'users/registrations#new'
    post 'account/signup' => 'users/registrations#create'
    get 'account/signout' => 'users/sessions#destroy'
    get 'account/profile_edit' => 'users/edit'
  end

  resources :dbtest
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
