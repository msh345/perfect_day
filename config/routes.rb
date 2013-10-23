PerfectDay::Application.routes.draw do
 match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
 match 'auth/failure', to: redirect('/'), via: [:get, :post]
 match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


 root to: "sessions#index"
 resources :users
 resources :favorites, except: :destroy
 delete '/destroy_favorite' => "favorites#destroy", as: 'destroy_favorite'
 get '/search' => "itineraries#search"
 post '/search' => "spot_types#show"
 get '/browse' => "itineraries#browse"
 get '/new' => "itineraries#new"
 post '/create' => "itineraries#create"
 resources :itineraries, except: [:browse,:new,:favorite,:create] do
  resources :spots
 end

 get '/upvote/itin/:id'      => "itineraries#upvote"
 get '/upvote/spot/:id'      => "spots#upvote"
 get '/data/spot_types.json' => 'spots#spot_types'
end


