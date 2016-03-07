Rails.application.routes.draw do
  resources :comments
  resources :solutions, :has_many => :comments
  resources :tasks, :has_many => :comments
end
