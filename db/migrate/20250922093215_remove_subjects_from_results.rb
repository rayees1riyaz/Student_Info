class RemoveSubjectsFromResults < ActiveRecord::Migration[7.1]
  def change
    remove_column :results, :subjects, :string
  end
end
