Rails.application.routes.draw do
  root "movies#index"

  resources :genres

  resources :users

  resource :session

  get "/signup" => "users#new"
  get "/signin" => "sessions#new"

  get "movies/filter/:scope" => "movies#index", as: :filtered_movies

  resources :movies do
    resources :reviews
    resources :favorites
  end
end
