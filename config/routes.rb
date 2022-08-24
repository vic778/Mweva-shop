Rails.application.routes.draw do
  resources :articles
  namespace :admin do
      resources :users
      resources :articles


      root to: "users#index"
    end
  root to: 'articles#index'
    devise_for :users
    resources :articles

end
