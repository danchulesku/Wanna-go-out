Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :events
  resources :users, only: %i[show edit update ]
  get "users", to: redirect("/users/sign_up")
end
