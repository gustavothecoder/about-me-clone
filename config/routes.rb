# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#homepage'

  get '/signup', to: 'users#new'
end
