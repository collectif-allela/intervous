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
    end
  end
  # root "articles#index"
end
