class AddingRoletoToEmployee < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :role, :string
  end
end
