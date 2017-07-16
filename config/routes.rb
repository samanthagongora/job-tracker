Rails.application.routes.draw do
  root to: "home#index"

  resources :jobs, only: [:edit, :destroy, :update, :show]

  resources :categories do
    resources :jobs
  end

  resources :companies do
    resources :jobs
  end
end
