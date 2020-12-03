Rails.application.routes.draw do
  devise_for :users
  root 'mangas#index'
  resources :mangas
  resources :users, only: [:show] do 
    resources :avatars, only: [:create]
  end
end
