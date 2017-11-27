class CreateChatrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chatrooms do |t|
      t.references :availability, foreign_key: true, index: true
      t.timestamps
    end
  end
end
