Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  mount ActionCable.server => '/cable'

  resources :messages
  resources :meetings
  resources :sales
  resources :documents
  resources :users

  resources :video_calls, only: [:create]


  resources :tasks, only: [:index, :create, :update, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check

end
