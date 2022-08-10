# frozen_string_literal: true

# Application Routes
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    resources :sellers
  end

  resources :categories
  resources :brands
  resources :products
  resource :carts
  resources :cart_items
  resources :orders
  resources :charges, only: [:new, :create]
  get '/decreament', to: 'cart_items#decreament'
  get '/increament', to: 'cart_items#increament'
  get '/remove_item', to: 'cart_items#remove_item'
  get '/unauthorized', to: 'index#unauthorized'
  root 'index#index'
end
