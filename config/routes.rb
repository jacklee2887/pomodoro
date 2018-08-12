Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'welcome#index'

resources :tasks
patch "tasks/:id/complete" => "tasks#complete", as: "task_complete"
post "tasks/search" => "tasks#search", as: "task_search"


resources :users, only: [:update, :destroy, :show]
get "/signup" => "users#new"
post "/users" => "users#create"


resources :tomatoes
post "/tomatoes/complete" => "tomatoes#complete", as: "tomato_complete"

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

get "/auth/:provider/callback" => "sessions#create_from_omniauth"


end