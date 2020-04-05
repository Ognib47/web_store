# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'orders/show'
  resources 'products', only: %i[index show]
  get 'search', to: 'products#search', as: 'search'
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  resources 'categories', only: %i[index show]

  # get 'categories/index'
  # get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
