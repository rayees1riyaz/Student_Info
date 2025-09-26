class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name
      t.integer :semester

      t.timestamps
    end
  end
end
