class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.string :description
      t.integer :capacity
      t.integer :price
      t.integer :duration
      t.string :photo
      t.string :category

      t.timestamps
    end
  end
end
