PerfectDay::Application.routes.draw do
 root to: "sessions#index"
 resources :sessions, except: :index
 resources :users
end
