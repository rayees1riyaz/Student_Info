class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.references :Student, null: false, foreign_key: true
      t.string :subjects
      t.decimal :marks
      t.integer :semesters

      t.timestamps
    end
  end
end
