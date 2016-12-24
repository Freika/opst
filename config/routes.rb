Rails.application.routes.draw do
  get 'pages/feedback'
  get 'pages/how_to'

  get 'statistics/main', as: :main_statistics

  get 'statistics/heroes', as: :heroes_statistics

  get 'statistics/maps', as: :maps_statistics

  devise_for :users
  resources :matches
  root 'pages#home'
end
