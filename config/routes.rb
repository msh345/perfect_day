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
 resources :itineraries, except: [:browse,:new,:favorite,:create]
end
