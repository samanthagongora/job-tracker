Rails.application.routes.draw do
  root to: "home#index"

  resources :jobs, only: [:edit, :destroy, :update, :show]

  resources :categories

  resources :companies do
    resources :jobs, shallow: true
  end
end
