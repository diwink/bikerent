Rails.application.routes.draw do
  root to: 'motos#index'
  devise_for :users #, only: [:new, :create]
  resources :motos do
    resources :rents, only: [:new, :create]
  end
end
