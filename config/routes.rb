Squid::Application.routes.draw do

  devise_for :admins, :skip => :registration
  devise_for :investors
  devise_for :users

  root to:'public#index'
  get '/dashboard' => 'dashboard#index'

  resources :information
  resources :user, except: [:new, :create]
  resources :investor, except: [:new, :create]
end
