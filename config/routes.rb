PerfectDay::Application.routes.draw do
 root to: "sessions#index"
 resources :sessions, except: :index

 resources :users

 get '/browse' => "itineraries#browse"
 get '/new' => "itineraries#new"
 get '/favorite' => "itineraries#favorite"
 post '/create' => "itineraries#create"
 resources :itineraries, except: [:browse,:new,:favorite,:create] do
  resources :spots
 end

 get '/upvote/itin/:id' => "itineraries#upvote"
 get '/upvote/:itin_spot_id/spot/:id' => "spots#upvote"
end
