require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'visitors#index'
  get '/search' => 'visitors#search'
  get '/about' => 'visitors#about'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  mount Sidekiq::Web => '/sidekiq'
end
