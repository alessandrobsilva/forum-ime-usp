Rails.application.routes.draw do

  root 'forums#index'

  devise_for :users, controllers: {registrations: "registrations" }

  resources :comments
  resources :courses
  resources :forums
  resources :posts
  resources :users

  get 'comments/new/:id', controller: 'comments', action: 'new'
  get 'courses/new/:id',  controller: 'courses',  action: 'new'
  get 'posts/new/:id',    controller: 'posts',    action: 'new'

end
