class RenameUserToOwner < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :user_id, :owner_id
  end
end
