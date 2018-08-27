Rails.application.routes.draw do
  get 'users/:user_id/interviews', to: 'interviews#index', as: 'interviews'
  get 'users/:user_id/interviews/new', to: 'interviews#new'
  post 'users/:user_id/interviews/create', to: 'interviews#create'

  root to: 'users#index'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }
  get 'profiles/:user_id/edit', to: 'profiles#edit', as: 'edit_profiles'
  post 'profiles/:user_id/edit', to: 'profiles#create'
  patch 'profiles/:user_id/edit', to: 'profiles#edit'
end
