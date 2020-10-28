require 'sidekiq/web'

Rails.application.routes.draw do

  get 'search/index'
  resources :categories, only: [:index]
  resources :teams, only: [:new, :create, :edit, :update]
  resources :team_documents, only: [:index, :show, :new, :create, :edit, :update]

  resources :documents, only: [:index,:show, :new, :create, :edit, :update]
  resources :connectors, only: [:index]
  resources :credentials, only: [:new, :create, :index]

  resources :pages do
    collection do
      get :search
    end
  end

  resources :search, only: [] do
    collection do
      get :index
    end
  end

  namespace :admin do
    resources :users
    resources :services
    resources :announcements
    resources :notifications

    root to: "users#index"
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }



  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
