class AddNameToWands < ActiveRecord::Migration[6.0]
  def change
    add_column :wands, :name, :string
  end
end
