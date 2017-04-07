Rails.application.routes.draw do

  devise_for :controllers
  # devise_for :clients, :path => '', :path_names => {:sign_up => 'register', :sign_in => 'login', :sign_out => 'logout'}, controllers: { registrations: "clients/registrations"}, :except => [:new_client_session, :client_session]
  devise_for :clients, controllers: { registrations: "client/registrations"}, :except => [:new_client_session, :client_session]
  devise_scope :client do
    get 'register', to: 'client/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  devise_for :users, controllers: { registrations: "users"}
  devise_scope :user do
    get 'register', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    delete 'logout', to: 'users/sessions#destroy'
  end


  root to: 'users/registrations#new'

  get '/' => 'users/registrations#new'
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
