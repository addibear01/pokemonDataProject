class Item < ApplicationRecord
  has_many :pokemon_items, dependent: :destroy
  has_many :pokemons, through: :pokemon_items

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :effect, presence: true
end
