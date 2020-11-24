class AddCoordinatesToWands < ActiveRecord::Migration[6.0]
  def change
    add_column :wands, :latitude, :float
    add_column :wands, :longitude, :float
  end
end
