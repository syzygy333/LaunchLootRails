Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :quests do
    resources :finds
    resources :engagements, only: [:create, :destroy]
  end
  resources :items, only: [:index]
end
