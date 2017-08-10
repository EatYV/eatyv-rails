Rails.application.routes.draw do
  resources :recipes do
    collection do 
      get :map
    end
  end
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "recipes#index"
end
