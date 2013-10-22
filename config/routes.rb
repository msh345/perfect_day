PerfectDay::Application.routes.draw do
 match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
 match 'auth/failure', to: redirect('/'), via: [:get, :post]
 match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

 root to: "sessions#index"
 # resources :sessions, except: :index

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
