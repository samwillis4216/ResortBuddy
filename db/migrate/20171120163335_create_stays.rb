class CreateStays < ActiveRecord::Migration[5.1]
  def change
    create_table :stays do |t|
      t.references :guest, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :room_no

      t.timestamps
    end
  end
end
