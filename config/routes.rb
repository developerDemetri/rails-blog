Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :comments

  root 'home#index'
  get 'home/index'

  get 'posts/new'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
