Rails.application.routes.draw do
  root to: 'motos#index'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :motos do
    resources :rents, only: [:new, :create, :edit, :update]
  end
  resources :rents, only: [:index] do
    member do
      patch "/approve", to: "rents#approve"
      patch "/reject", to: "rents#reject"
    end
  end
  get "/user_bikes", to: "pages#user_bikes"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
