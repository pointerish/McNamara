Rails.application.routes.draw do
  root 'user#show'

  devise_for :users
  resources :users do
    resources :groups
    resources :expenses
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
