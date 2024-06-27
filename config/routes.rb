Rails.application.routes.draw do
  root 'pokemon#index'
  get 'pokemon/:id', to: 'pokemon#show', as: 'pokemon_show'
end
