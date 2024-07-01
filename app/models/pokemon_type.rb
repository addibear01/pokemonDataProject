class PokemonType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type

  # Validations
  validates :pokemon_id, presence: true
  validates :type_id, presence: true
end
