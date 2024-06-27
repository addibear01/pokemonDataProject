class CreateAbilities < ActiveRecord::Migration[7.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
