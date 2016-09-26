Rails.application.routes.draw do
  resources :posts
  resources :comments

  root 'home#index'

  get 'home/index'

  get 'posts/new'

end
