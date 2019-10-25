Rails.application.routes.draw do
  post '/lists/:id/button', to: "follows#button", as: "follow_user"

  resources :users 
  resources :lists
  resources :searches
  
  resources :items do 
    resources :comments, only: [:create, :destroy]
  end

  get '/users/home' => 'users#home'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'welcome#home' 

end
