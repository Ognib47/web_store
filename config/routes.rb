# frozen_string_literal: true

Rails.application.routes.draw do
  get 'abouts/show'
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

  scope 'checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
  # get 'categories/index'
  # get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
