class TypesController < ApplicationController
  require 'httparty'

  def index
    response = HTTParty.get('https://pokeapi.co/api/v2/type')
    @types = response.parsed_response['results']

    @types.each do |type_data|
      Type.find_or_create_by(name: type_data['name'])
    end

    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])
    response = HTTParty.get("https://pokeapi.co/api/v2/type/#{@type.name}")
    @type_data = response.parsed_response

    @pokemons = @type_data['pokemon'].map do |pokemon_data|
      Pokemon.find_or_create_by(name: pokemon_data['pokemon']['name'])
    end
  end
end

has context menu
