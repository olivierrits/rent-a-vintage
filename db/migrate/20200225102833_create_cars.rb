class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.integer :year
      t.text :description
      t.references :user, foreign_key: true
      t.date :availabilty, array: true, :default => []

      t.timestamps
    end
  end
end
