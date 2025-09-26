class RenameStudentIdInResults < ActiveRecord::Migration[7.1]
  def change
        remove_index :results, :Student_id
    rename_column :results, :Student_id, :student_id
    add_index :results, :student_id
  end
end
