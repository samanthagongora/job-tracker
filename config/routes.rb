Rails.application.routes.draw do
  root to: "home#index"

  resources :jobs, only: [:edit, :destroy, :update, :show] do
    resources :comments, only: [:new, :create]
  end

  resources :categories

  resources :contacts, only: [:new, :create]

  resources :companies do
    resources :contacts, shallow: true
    resources :jobs, shallow: true
  end
end
