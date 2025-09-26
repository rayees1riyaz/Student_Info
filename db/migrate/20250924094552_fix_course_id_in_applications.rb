class FixCourseIdInApplications < ActiveRecord::Migration[7.1]
  def change
    # Remove the old index first
    remove_index :applications, name: "index_applications_on_Course_id"

    # Rename the column
    rename_column :applications, :Course_id, :course_id

    # Add a new index with the correct name
    add_index :applications, :course_id
  end
end
