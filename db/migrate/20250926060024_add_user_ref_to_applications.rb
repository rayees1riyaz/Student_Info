class AddUserRefToApplications < ActiveRecord::Migration[7.1]
  def change
    add_reference :applications, :user, foreign_key: true, null: true
  end
end
