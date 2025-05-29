Rails.application.routes.draw do
  
  root 'home#index'

  # Devise routes should come first
  devise_for :users

  # Namespaced admin routes
  namespace :staff do
    get "dashboard/index"
  end

  namespace :admin do
    get "dashboard/index"
    resources :user_roles, only: [:edit, :update]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :posts, only: [:index, :show, :destroy]
    resources :reports, only: [:index, :show, :update]
  end

  # Regular resources
  resources :bookmarks
  resources :notifications
  resources :post_categories
  resources :categories
  resources :comments
  resources :likes
  resources :conversations
  resources :messages
  resources :payments
  resources :media
  resources :posts
  resources :subscriptions
  resources :subscription_plans
  resources :profiles

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

end