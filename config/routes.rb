Rails.application.routes.draw do
  resources :pokemon, only: [:index, :show]
  get 'pokemon/search', to: 'pokemon#search', as: 'search_pokemon'
  root 'pokemon#index'
end
