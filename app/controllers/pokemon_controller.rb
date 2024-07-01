class PokemonController < ApplicationController
  require 'httparty'
  require 'will_paginate/array'

  def index
    if params[:search].present?
      response = HTTParty.get("https://pokeapi.co/api/v2/pokemon?limit=1000")
      pokemons = response.parsed_response['results']
      filtered_pokemons = pokemons.select { |pokemon| pokemon['name'].downcase.include?(params[:search].downcase) }
      @pokemons = filtered_pokemons.paginate(page: params[:page], per_page: 10)
    else
      response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=1000')
      @pokemons = response.parsed_response['results'].paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{params[:id]}")
    @pokemon = response.parsed_response
  end
end
