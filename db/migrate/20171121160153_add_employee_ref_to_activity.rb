class AddEmployeeRefToActivity < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :employee, foreign_key: true
  end
end
