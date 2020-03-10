Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get '/search', to: 'home#search'

  resources :tv_shows, only: [] do
    member do
      put 'favorite'
    end
  end
end
