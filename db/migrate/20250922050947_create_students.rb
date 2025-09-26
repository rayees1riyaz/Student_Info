class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone_number
      t.date :dob

      t.timestamps
    end
  end
end
