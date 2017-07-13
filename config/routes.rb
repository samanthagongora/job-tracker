Rails.application.routes.draw do
  resources :jobs
  
  resources :companies do
    resources :jobs
  end
end
