Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :quests, only: [:index, :new, :create, :show]
end
