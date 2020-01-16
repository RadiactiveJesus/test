Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'comments/create'
  get 'comments/destroy'
  resources :posts
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get 'home/index'
end
