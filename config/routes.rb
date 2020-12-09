Rails.application.routes.draw do
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/search' => 'static_pages#search', :as => 'search_page'

  devise_for :users
  root "static_pages#index", page: "home"
  resources :users
  
  resources :library_items
  resources :wishlist_items, only: [:create, :destroy]


  resources :mangas, except: [:destroy] do
    resources :library_items
    resources :wishlist_items, only: [:create, :destroy]
  end
  #========================
  # Routes Private messages
  #========================
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  # Contact route path
  resources :contacts, only: [:index, :new, :create]
  resources :categories, only: [:index, :show]
end
