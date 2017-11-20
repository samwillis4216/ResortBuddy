class AddinglastNameToGuest < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :last_name, :string
  end
end
