class CreatePokemonItems < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_items do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
