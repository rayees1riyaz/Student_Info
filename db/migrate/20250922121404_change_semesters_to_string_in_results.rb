class ChangeSemestersToStringInResults < ActiveRecord::Migration[7.1]
  def change
     change_column :results, :semesters, :string
  end
end
