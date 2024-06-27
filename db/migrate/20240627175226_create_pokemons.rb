class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :height
      t.integer :weight
      t.integer :base_experience
      t.text :abilities
      t.text :moves

      t.timestamps
    end
  end
end
