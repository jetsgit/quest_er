Rails.application.routes.draw do

  resources :questions

  devise_for :users
  root to: "questions#index"

  resources :users, :only => [:show, :index]
end
