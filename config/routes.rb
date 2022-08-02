Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    :sessions => "users/sessions",
    :registrations => "users/registrations" }


  devise_scope :user do
  # resources :sellers
  resources :sellers
  # get "/sellers_registeration", to: "sellers#new"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/devise_scope")
  root "index#index"
end
