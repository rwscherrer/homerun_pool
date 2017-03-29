Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'teams#index'

  get '/players' => 'players#index'
  get '/team/:id' => 'teams#show'
  get '/player/:id' => 'players#show'
  get 'players/import' => 'players#import'
  post 'players/import' => 'players#import'

end
