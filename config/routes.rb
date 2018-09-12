Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [] do
    resources :interviews
  end

  post '/users/:user_id/interviews/send', to: 'interviews#send_email', as: 'send_email'

  devise_for :users

  get 'profiles/:user_id/edit', to: 'profiles#edit', as: 'edit_profile'
  patch 'profiles/:user_id', to: 'profiles#update', as: 'profile'
end
