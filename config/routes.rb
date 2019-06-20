Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets 
  resources :users, only: :show
  resources :relationships, only: [:create, :destroy]
  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'
  get '/post/hashtag/:name', to: "tweets#hashtag"
end
