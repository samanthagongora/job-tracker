Rails.application.routes.draw do
  root to: "home#index"

  resources :jobs, only: [:edit, :destroy, :update, :show] do
    resources :comments, only: [:new, :create]
  end

  resources :categories

  resources :contacts, only: [:new, :create]

  resources :companies do
    resources :jobs, shallow: true
    resources :contacts, shallow: true
  end
end
