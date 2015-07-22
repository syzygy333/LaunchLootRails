Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :quests do
    resources :finds, only: [:index]
    resources :engagements, only: [:create, :destroy]
  end
  resources :finds, only: [:show]
  resources :items, only: [:index]
  resources :users, only: [:show]
end
