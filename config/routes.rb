Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'comments/create'
  get 'comments/destroy'
  resources :posts
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', omniauth_callbacks: 'omniauth_callbacks'}
  get 'users/index'
  get 'users/show'
  get '/friends', to: 'home#friends'
  post '/create_friend', to: 'friendships#create'
  patch '/confirm_friend', to: 'friendships#confirm'
  delete '/ignore_request', to: 'friendships#ignore'
  delete '/cancel_request', to: 'friendships#cancel'
  delete '/delete_friend', to: 'friendships#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get 'home/index'
end
