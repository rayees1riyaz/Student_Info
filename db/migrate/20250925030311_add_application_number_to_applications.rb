class AddApplicationNumberToApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :application_number, :string
    add_index :applications, :application_number, unique: true
  end
end
