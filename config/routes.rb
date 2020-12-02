Rails.application.routes.draw do
  resources :mangas
  devise_for :users
  root "static_pages#index", page: "home"
  resources :users, only: [:show] do 
    resources :avatars, only: [:create]
  end
end
