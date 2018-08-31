Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: :index do
    resources :interviews, except: :show
  end

  devise_for :users

  get 'profiles/:user_id/edit', to: 'profiles#edit', as: 'edit_profiles'
  post 'profiles/:user_id/edit', to: 'profiles#create'
  patch 'profiles/:user_id/edit', to: 'profiles#edit'
end
