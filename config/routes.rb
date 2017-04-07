Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users"}
  devise_scope :user do
    get 'register', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    delete 'logout', to: 'users/sessions#destroy'
  end


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
