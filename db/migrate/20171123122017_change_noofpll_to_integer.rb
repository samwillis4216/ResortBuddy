class ChangeNoofpllToInteger < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :no_ppl
    add_column :bookings, :no_ppl, :integer
  end
end
