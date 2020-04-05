# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'orders/show'
  resources 'products', only: %i[index show]
  resources 'categories', only: %i[index show]

  # get 'categories/index'
  # get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
