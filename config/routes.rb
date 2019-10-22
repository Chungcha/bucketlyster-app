Rails.application.routes.draw do
  resources :follows, only: [:create, :destroy]

  resources :items do 
    resources :comments, only: [:create, :destroy]
  end

  resources :lists
  
  get '/users/home' => 'users#home'
  resources :users 


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'welcome#home' 

end
