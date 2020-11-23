class RemoveStrengthFromWands < ActiveRecord::Migration[6.0]
  def change
    remove_column :wands, :strength, :string
  end
end
