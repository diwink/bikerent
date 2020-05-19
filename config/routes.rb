Rails.application.routes.draw do
  root to: 'motos#index'
  devise_for :users #, only: [:new, :create]
    # resources :motos, except: [:index, :show]
  resources :motos #, only: [:index, :show, :new, :create]
end
