Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'teams#index'

  get '/players' => 'players#index'
  get 'players/import' => 'players#import'
  post 'players/import' => 'players#import'
  get '/player/:id' => 'players#show'

  get '/teams' => 'teams#index'
  get '/team/:id' => 'teams#show'
  get '/team/:id/edit' => 'teams#edit'
  patch '/team/:id' => 'teams#update'
  get '/teams/new' => 'teams#new'
  post '/teams' => 'teams#create', as: :team_create


end
