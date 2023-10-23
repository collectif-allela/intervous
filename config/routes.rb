Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :comments
  resources :actualities
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # Your API routes
  namespace :api do
    namespace :app do
      # User Registration
      mount_devise_token_auth_for 'User', at: 'auth'
      # User Login
      post 'auth/sign_in', to: 'user_token#create'
      # User Logout (Destroy Token)
      delete 'auth/sign_out', to: 'user_token#destroy'
      # Token Validation
      get 'auth/validate_token', to: 'user_token#validate_token'

      resources :comments
      resources :posts
      resources :actualities
    end
  end
  # root "articles#index"
end
