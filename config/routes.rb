Rails.application.routes.draw do
  resources :follows, only: [:create, :destroy]

  resources :items do 
    resources :comments
  end
  resources :lists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
