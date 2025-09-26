class AddSubjectToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :subject, :string
  end
end
