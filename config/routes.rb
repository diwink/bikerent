Rails.application.routes.draw do
  root to: 'motos#index'
  devise_for :users #, only: [:new, :create]
    # resources :motos, except: [:index, :show]
  resources :motos do
    resources :rents, only: [:new, :create]
  end
  resources :rents, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
