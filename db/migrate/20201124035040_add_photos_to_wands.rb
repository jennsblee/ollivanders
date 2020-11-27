class AddPhotosToWands < ActiveRecord::Migration[6.0]
  def change
    add_column :wands, :photos, :string, array: true, default: []
  end
end
