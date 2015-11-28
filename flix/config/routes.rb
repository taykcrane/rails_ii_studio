Rails.application.routes.draw do
  resources :users

  root "movies#index"
  get "/signup" => "users#new"


  resources :movies do
    resources :reviews
  end
end
