Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public#index'
  resources :clays
  # resources :glazes
  # resources :manufacturers
  resources :recipes do
    resources :clays, only: %i[index create], controller: 'recipe/clays', constraints: { format: 'js' }
    resources :layers, only: %i[index create], controller: 'recipe/layers', constraints: { format: 'js' }
  end
end
