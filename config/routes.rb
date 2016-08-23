Rails.application.routes.draw do

  resources :users, only: [:new, :create, :edit, :update, :index, :destroy]
  resources :sessions, only: [:new, :create, :edit, :update, :index] do
    delete :destroy, on: :collection
  end

  get 'sessions/new'

  # resources :users, only: [:new, :create]

  get 'users/new'

  get '/home' => "home#home", as: :home

  get '/about' => "home#about", as: :about

  root "home#home"

  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
