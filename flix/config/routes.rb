Rails.application.routes.draw do
  resources :users
  resource :session

  root "movies#index"
  get "/signup" => "users#new"
  get "/signin" => "sessions#new"


  resources :movies do
    resources :reviews
  end
end
