Rails.application.routes.draw do
  resources :votes
  namespace :api do
    namespace :app do

      resources :comments
      resources :posts
      resources :actualities

      #Votes
      get 'votes/count', to: 'votes#count'
      delete 'votes/delete_by_criteria', to: 'votes#delete_by_criteria'
      resources :votes

      # User Registration
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users
      # User Login
      post 'auth/sign_in', to: 'user_token#create'
      # User Logout (Destroy Token)
      delete 'auth/sign_out', to: 'user_token#destroy'
      # Token Validation
      get 'auth/validate_token', to: 'user_token#validate_token'
    end
  end
  # root "articles#index"
end
