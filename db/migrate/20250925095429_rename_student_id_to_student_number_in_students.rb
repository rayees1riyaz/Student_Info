class RenameStudentIdToStudentNumberInStudents < ActiveRecord::Migration[7.1]
  def change
      rename_column :students, :student_id, :student_number
  end
end
