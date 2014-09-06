ContinuumRails::Application.routes.draw do
  root 'projects#index'

  get '/repositories/auth', to: 'repositories#auth'
  resources :repositories
  resources :regressions

  resources :projects do
    resources :stages
    resources :releases
  end

end
