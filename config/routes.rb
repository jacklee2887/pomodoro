Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :tasks
resources :users, only: [:update, :destroy, :show]
get "/signup" => "users#new"
post "/users" => "users#create"


get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

get "/auth/:provider/callback" => "sessions#create_from_omniauth"


end