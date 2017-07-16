Rails.application.routes.draw do
  root to: "home#index"

  resources :jobs, only: [:edit, :destroy, :update, :show]
  resources :category, only: [:create, :index]

  resources :companies do
    resources :jobs
  end
end
