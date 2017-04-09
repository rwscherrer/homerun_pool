Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do

      root 'teams#index', as: :authenticated_root
    end

  unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
      get 'register', to: 'users/registrations#new'
      post 'sign up', to: 'users/registrations#create'
    end
  end


  resources :teams do
    get :autocomplete_player_name, :on => :collection
  end

# Player routes
  get '/players' => 'players#index'
  get '/player/:id' => 'players#show'
  get 'players/import' => 'players#import'
  post 'players/import' => 'players#import'
  
# Team routes
  get '/teams' => 'teams#index'
  get '/team/:id' => 'teams#show'
  get '/team/:id/edit' => 'teams#edit'
  patch '/team/:id' => 'teams#update'
  get '/teams/new' => 'teams#new'
  post '/teams' => 'teams#create', as: :team_create


end
