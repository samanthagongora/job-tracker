Rails.application.routes.draw do
  resources :jobs, only: [:edit, :destroy, :update, :show]

  resources :companies do
    resources :jobs
  end
end
