class ChangeLicenseColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :licence_number, :license_number
  end
end
