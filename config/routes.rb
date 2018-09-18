Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [] do
    resources :interviews do
      collection do
        post :apply
      end
    end
  end

  devise_for :users

  get 'profiles/:user_id/edit', to: 'profiles#edit', as: 'edit_profile'
  patch 'profiles/:user_id', to: 'profiles#update', as: 'profile'
end
