Rails.application.routes.draw do
  root to: "home#index"

  resources :jobs, only: [:edit, :destroy, :update, :show]

  resources :categories, only: [:create, :index, :new] do
    resources :jobs
  end

  resources :companies do
    resources :jobs
  end
end
