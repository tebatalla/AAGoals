Rails.application.routes.draw do
  resources :users
  resource  :session, only: [:new, :destroy, :create]
  resources :goals, only: [:new, :create, :edit, :update, :destroy]
end
