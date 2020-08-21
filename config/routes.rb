Rails.application.routes.draw do
  resources :scores
  # resources :levels
  resources :users, except: [:edit, :update]
  post "/login", to: "users#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
