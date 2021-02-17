Rails.application.routes.draw do
  root 'users#show'

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  
  devise_for :users
  resources :users do
    resources :groups
    resources :expenses
  end
end
