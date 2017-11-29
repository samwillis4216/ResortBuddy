class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :notifiable, polymorphic: true
      t.references :notifierable, polymorphic: true
      t.references :availability, foreign_key: true, index: true
      t.boolean :read, default: false
      t.boolean :cleared, default: false
      t.timestamps
    end
  end
end
