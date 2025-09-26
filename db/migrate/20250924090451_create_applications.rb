class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :phone_number
      t.date :dob
      t.references :Course, null: false, foreign_key: true
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
