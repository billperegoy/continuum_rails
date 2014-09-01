ContinuumRails::Application.routes.draw do
  root 'projects#index'

  resources :repositories
  resources :regressions

  resources :projects do
    resources :stages
    resources :releases
  end
end
