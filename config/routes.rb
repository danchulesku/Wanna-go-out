Rails.application.routes.draw do
  resources :subscriptions
  resources :comments
  devise_for :users
  root to: "events#index"

  resources :events do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    resources :photos, only: %i[create destroy]
  end

  resources :users, only: %i[show edit update]
  get "users", to: redirect("/users/sign_up")
end
