Rails.application.routes.draw do
  resources :follows, only: [:create, :destroy]
  resources :comments
  resources :items
  resources :lists
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'welcome#home'

end
