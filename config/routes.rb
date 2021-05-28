Rails.application.routes.draw do
  devise_for :users
  root to: 'tours#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours, except: [:new, :edit] do
    resources :events, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]
  resources :events, only: [:show, :update, :destroy]
end
