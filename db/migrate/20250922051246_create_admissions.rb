class CreateAdmissions < ActiveRecord::Migration[7.1]
  def change
    create_table :admissions do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.decimal :fee
      t.date :date_of_joining

      t.timestamps
    end
  end
end
