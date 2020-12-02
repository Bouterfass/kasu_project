Rails.application.routes.draw do
  get 'mangas/index'
  get 'mangas/show'
  get 'mangas/edit'
  get 'mangas/create'
  get 'mangas/new'
  get 'mangas/update'
  get 'mangas/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do 
    resources :avatars, only: [:create]
  end
end
