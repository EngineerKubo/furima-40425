Rails.application.routes.draw do
  devise_for :users
  get 'products/index'
  get 'products/new'
  root to: 'products#index'
  resources :products, only: [:new, :create, :index, :show, :edit, :update]
end