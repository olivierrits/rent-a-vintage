Rails.application.routes.draw do
  get 'users/dashboard', to: 'users#dashboard', as: 'user_dashboard'
  get 'users/landing', to: 'users#landing', as: 'user_landing'
  # delete '/users', to: 'devise/registrations#destroy', as: 'destroy_account'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :rides, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
  end

  resources :rides, only: [ :new, :create, :show, :edit, :update, :destroy ]

end
