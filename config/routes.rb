# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  get '/examples', to: 'users#examples'
  get '/signup', to: 'users#new'
  post '/next_signup_step/:step', to: 'users#next_signup_step'
  post '/users', to: 'users#create'
  get '/:username', to: 'users#show'
end
