Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/docs", to: "docs#index"
  root "docs#index"
  post "/auth/login", to: 'authentication#login'
  post "/auth/register", to: 'authentication#register'

  namespace :api do
    namespace :v1 do
      resources :admins
      resources :users
      resources :authors

      jsonapi_resources :users
      jsonapi_resources :roles
      jsonapi_resources :authors
    end
  end
end
