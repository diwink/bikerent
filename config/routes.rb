Rails.application.routes.draw do
  root to: 'motos#index'
  devise_for :users#, only: [:new, :create]
    # resources :motos, except: [:index, :show]
  resources :motos#, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
