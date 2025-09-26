class AddAdmissionNumberToAdmissions < ActiveRecord::Migration[7.1]
  def change

    add_column :admissions, :admission_number, :string
    add_index  :admissions, :admission_number, unique: true
  end
end
