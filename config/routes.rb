Rails.application.routes.draw do
  get 'products/index'
  get 'products/new'
  root to: 'products#index'
  resources :products
end

