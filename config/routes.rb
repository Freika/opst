Rails.application.routes.draw do
  get 'pages/feedback'
  get 'pages/how_to'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :matches, except: :show
  resources :qualifications, only: [:create, :update]
  resources :users, only: :show, path: 'profile'
  root 'pages#home'

  namespace :statistics do
    get 'main'
    get 'heroes'
    get 'maps'
  end

  namespace :api do
    resources :matches, only: :create
  end
end
