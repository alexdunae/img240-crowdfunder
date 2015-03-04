Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show] do
    resources :pledges, only: [:new, :create]
    resources :funding_levels, only: [:new, :create]
  end

  root 'projects#index'
end
