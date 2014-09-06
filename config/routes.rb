ContinuumRails::Application.routes.draw do
  root 'projects#index'

  get '/projects/auth', to: 'projects#auth'
  get '/projects/auth_redirect', to: 'projects#auth_redirect'

  resources :repositories
  resources :regressions

  resources :projects do
    resources :stages
    resources :releases
  end
end
