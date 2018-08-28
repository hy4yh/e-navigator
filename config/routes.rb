Rails.application.routes.draw do
  get 'users/:user_id/interviews', to: 'interviews#index', as: 'interviews'
  get 'users/:user_id/interviews/new', to: 'interviews#new'
  post 'users/:user_id/interviews/create', to: 'interviews#create'
  get 'users/:user_id/interviews/:interview_id/edit', to: 'interviews#edit', as: 'edit_interview'
  patch 'users/:user_id/interviews/:interview_id', to: 'interviews#update'
  delete 'users/:user_id/interviews/:interview_id', to: 'interviews#destroy', as: 'delete_interview'

  root to: 'users#index'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }
  get 'profiles/:user_id/edit', to: 'profiles#edit', as: 'edit_profiles'
  post 'profiles/:user_id/edit', to: 'profiles#create'
  patch 'profiles/:user_id/edit', to: 'profiles#edit'
end
