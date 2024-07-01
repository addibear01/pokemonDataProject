class Pokemon < ApplicationRecord
  has_many :pokemon_types, dependent: :destroy
  has_many :types, through: :pokemon_types
  has_many :abilities, dependent: :destroy
  has_many :moves, dependent: :destroy
  has_many :pokemon_items, dependent: :destroy
  has_many :items, through: :pokemon_items

  accepts_nested_attributes_for :abilities, :moves, :types, :items

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :base_experience, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
