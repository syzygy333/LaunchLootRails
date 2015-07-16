Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :quests do
    resources :finds
  end
  resources :items, only: [:index]
  resources :user, only: [:show]
end
