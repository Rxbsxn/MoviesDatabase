Rails.application.routes.draw do
  root 'index#index'

  resources :actors
  resources :movies
  resources :genres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
