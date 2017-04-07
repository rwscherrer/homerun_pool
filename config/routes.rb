Rails.application.routes.draw do

  devise_for :users

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
