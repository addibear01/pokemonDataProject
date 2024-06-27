class PokemonController < ApplicationController
  require 'httparty'

  def index
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=10')
    @pokemons = response.parsed_response['results']
  end

  def show
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{params[:id]}")
    @pokemon = response.parsed_response
  end
end
