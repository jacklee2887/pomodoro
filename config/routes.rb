Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :tasks
patch "tasks/:id/complete" => "tasks#complete", as: "task_complete"


resources :users, only: [:update, :destroy, :show]
get "/signup" => "users#new"
post "/users" => "users#create"


resources :tomatoes
patch "tomato/:id/timer" => "tomatoes#timer", as: "tomato_timer"

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

get "/auth/:provider/callback" => "sessions#create_from_omniauth"


end