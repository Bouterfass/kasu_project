Rails.application.routes.draw do
  get 'messages/index'
  get 'conversations/index'
  devise_for :users
  root "static_pages#index", page: "home"
  resources :users
  
  resources :library_items

  resources :mangas, except: [:destroy] do
    resources :library_items
  end
  #========================
  # Routes Private messages
  #========================
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
end
