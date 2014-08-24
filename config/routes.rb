ContinuumRails::Application.routes.draw do
  root 'projects#index'

  resources :stages
  resources :projects
end
