Rails.application.routes.draw do
  resources :mangas
  devise_for :users
  root "static_pages#index", page: "home"
  resources :users
  resources :library_items
end
