class AddPhotoToPhotographers < ActiveRecord::Migration[5.1]
  def change
    add_column :photographers, :photo, :string
  end
end
