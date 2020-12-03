Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index", page: "home"
  resources :users
  resources :library_items


  resources :mangas, except: [:destroy] 
end
