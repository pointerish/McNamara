Rails.application.routes.draw do
  root 'users#show'

  devise_for :users
  resources :users do
    resources :groups
    resources :expenses, only: :show
  end
end
