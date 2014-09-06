ContinuumRails::Application.routes.draw do
  root 'projects#index'

  get '/github/auth', to: 'github#auth'
  get '/github/auth_redirect', to: 'github#auth_redirect'

  resources :repositories
  resources :regressions

  resources :projects do
    resources :stages
    resources :releases
  end
end
