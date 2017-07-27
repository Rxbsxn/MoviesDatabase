Rails.application.routes.draw do

  root 'index#index'

  resources :actors
  resources :movies
  resources :genres
  resources :awards
  resources :stats, only: [:index]

  namespace :api do
    jsonapi_resources :actors do
      jsonapi_relationships
    end
    jsonapi_resources :movies do
      jsonapi_relationships
    end
    jsonapi_resources :genres do
      jsonapi_relationships
    end
    jsonapi_resources :awards do
      jsonapi_relationships
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
