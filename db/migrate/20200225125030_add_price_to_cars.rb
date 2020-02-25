class AddPriceToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :price, :integer
  end
end
