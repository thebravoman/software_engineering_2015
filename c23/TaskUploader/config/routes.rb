require 'sidekiq/web'

Rails.application.routes.draw do
  resources :comments
  resources :solutions, :has_many => :comments
  resources :tasks, :has_many => :comments

  mount Sidekiq::Web => '/jobs' 
end
