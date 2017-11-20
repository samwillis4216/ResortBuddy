class CreateResorts < ActiveRecord::Migration[5.1]
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :address
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
