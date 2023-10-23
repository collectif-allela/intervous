Rails.application.routes.draw do
  resources :comments
  resources :actualities
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # Your API routes
  namespace :api do
    namespace :app do
      resources :posts
      resources :actualities
    end
  end
  # root "articles#index"
end
