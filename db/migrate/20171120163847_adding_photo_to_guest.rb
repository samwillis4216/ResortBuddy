class AddingPhotoToGuest < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :photo, :string
  end
end
