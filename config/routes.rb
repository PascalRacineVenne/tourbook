Rails.application.routes.draw do
  # get 'events/index'
  get 'events/show'
  get 'events/new'
  # get 'events/create'
  get 'events/edit'
  # get 'events/update'
  # get 'events/destroy'
  get 'tours/index'
  get 'tours/show'
  get 'tours/new'
  # get 'tours/create'
  get 'tours/edit'
  # get 'tours/update'
  # get 'tours/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours do
    resources :events, only: [:new, :create]
    resources :tour_statuses, only: [:index, :new, :create]
  end

  resources :events, only: [:show, :edit, :update, :destroy]
  resources :tour_statuses, only: [:show, :edit, :update, :destroy]
end
