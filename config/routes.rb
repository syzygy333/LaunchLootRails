Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :quests
  resources :items, only: [:index]
end
