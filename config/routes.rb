Rails.application.routes.draw do
  root 'pokemon#index'
  get 'pages/map'
  get 'pages/about'

  get 'map', to: 'pages#map'
  get 'about', to: 'pages#about'
  resources :pokemons, only: [:index]
  resources :pokemon, only: [:show]
  get 'pokemon/search', to: 'pokemon#index', as: 'search_pokemon'

end
