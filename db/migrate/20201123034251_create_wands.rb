class CreateWands < ActiveRecord::Migration[6.0]
  def change
    create_table :wands do |t|
      t.string :wood
      t.string :core
      t.integer :price
      t.integer :size
      t.integer :strength
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
