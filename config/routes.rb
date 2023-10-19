Rails.application.routes.draw do
  resources :actualities
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # Your API routes
  namespace :api do
    namespace :app do
      ressources :posts
      ressources :actualities
    end
  end
  # root "articles#index"
end
