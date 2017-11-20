class AddingfirstNameToEmployee < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :first_name, :string
  end
end
