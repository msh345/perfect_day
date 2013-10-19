PerfectDay::Application.routes.draw do
 root to: "sessions#index"
 resources :sessions, except: :index
 resources :users
 get '/browse' => "itineraries#browse"
 get '/new' => "itineraries#new"
 get '/favorite' => "itineraries#favorite"
 post '/create' => "itineraries#create"
 resources :itineraries, except: [:browse,:new,:favorite,:create]
end
