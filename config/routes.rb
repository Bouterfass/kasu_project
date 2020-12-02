Rails.application.routes.draw do
  resources :mangas
  devise_for :users
  root "static_pages#index", page: "home"
<<<<<<< HEAD
  resources :users
  resources :library_items
=======
  resources :users, only: [:show] do 
    resources :avatars, only: [:create]
  end

  resources :mangas, except: [:destroy] 
>>>>>>> develop
end
