PerfectDay::Application.routes.draw do
  get "/login" => "sessions#new"
  post '/login' => 'sessions#create'
  delete "/logout" => "sessions#destroy"
  get '/map_data' => 'maps#map_data'
  get '/signup' => 'users#new'
  post 'map_data_tile' => 'maps#map_data_tile'

  root 'maps#index'
  resources 'users'
  resources 'locations'
end
