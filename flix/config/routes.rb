Rails.application.routes.draw do
  resources :genres

  resources :users
  resource :session

  root "movies#index"
  get "/signup" => "users#new"
  get "/signin" => "sessions#new"


  resources :movies do
    resources :reviews
    resources :favorites
  end
end
