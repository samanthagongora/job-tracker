Rails.application.routes.draw do
  resources :jobs, only: [:edit, :destroy, :update, :show]
  resources :category

  resources :companies do
    resources :jobs
  end
end
