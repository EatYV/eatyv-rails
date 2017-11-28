Rails.application.routes.draw do
  get 'public_website/index'
  resources :checkout,  only: [:new, :create, :show]
  resources :recipes
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'checkout#new'
end
