class AddingfirstNameToGuest < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :first_name, :string
  end
end
