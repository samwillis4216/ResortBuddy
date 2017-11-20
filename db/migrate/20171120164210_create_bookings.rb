class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :availability, foreign_key: true
      t.references :guest, foreign_key: true
      t.string :no_ppl

      t.timestamps
    end
  end
end
