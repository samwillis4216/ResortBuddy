class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :body
      t.references :chatroom, foreign_key: true, index: true
      t.references :messageable, polymorphic: true

      t.timestamps
    end
  end
end
