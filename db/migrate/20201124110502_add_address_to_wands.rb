class AddAddressToWands < ActiveRecord::Migration[6.0]
  def change
    add_column :wands, :address, :string
  end
end
