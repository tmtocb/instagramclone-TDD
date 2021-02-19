Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'
  resources :users, only: %i[show edit update]
  resources :posts, only: %i[new create]
end
