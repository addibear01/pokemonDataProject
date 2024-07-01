class PokemonItem < ApplicationRecord
  belongs_to :pokemon
  belongs_to :item

  # Validations
  validates :pokemon_id, presence: true
  validates :item_id, presence: true
end
