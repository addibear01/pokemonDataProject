class PokemonController < ApplicationController
  require 'httparty'

  def index
    if params[:search].present?
      response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{params[:search]}")
      @pokemons = [response.parsed_response] if response.code == 200
    else
      response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=10')
      @pokemons = response.parsed_response['results']
    end
  end

  def show
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{params[:id]}")
    @pokemon = response.parsed_response
  end
end
