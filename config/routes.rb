Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    get 'register', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    delete 'logout', to: 'users/sessions#destroy'
  end


  root to: 'teams#index'

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
