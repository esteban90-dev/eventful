Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, :events
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'events#index'
end
