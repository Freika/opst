Rails.application.routes.draw do
  get 'pages/feedback'
  get 'pages/how_to'

  get 'statistics/main', as: :main_statistics
  get 'statistics/heroes', as: :heroes_statistics
  get 'statistics/maps', as: :maps_statistics

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :matches, except: :show
  resources :qualifications, only: [:create, :update]
  resources :users, only: :show
  root 'pages#home'
end
