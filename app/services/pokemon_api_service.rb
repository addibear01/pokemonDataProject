# app/services/pokemon_api_service.rb
require 'httparty'

class PokemonApiService
  BASE_URL = 'https://pokeapi.co/api/v2'

  def fetch_pokemon(name)
    response = HTTParty.get("#{BASE_URL}/pokemon/#{name}")
    return nil unless response.success?

    pokemon_data = {
      name: response['name'],
      height: response['height'],
      weight: response['weight'],
      base_experience: response['base_experience'],
      abilities: response['abilities'].to_json,
      moves: response['moves'].to_json
    }

    save_pokemon_to_database(pokemon_data)
  end

  private

  def save_pokemon_to_database(pokemon_data)
    pokemon = Pokemon.find_or_initialize_by(name: pokemon_data[:name])
    pokemon.update(
      height: pokemon_data[:height],
      weight: pokemon_data[:weight],
      base_experience: pokemon_data[:base_experience],
      abilities: pokemon_data[:abilities],
      moves: pokemon_data[:moves]
    )
    pokemon
  end
end
