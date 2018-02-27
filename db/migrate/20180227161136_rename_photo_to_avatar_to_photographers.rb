class RenamePhotoToAvatarToPhotographers < ActiveRecord::Migration[5.1]
  def change
    rename_column :photographers, :photo, :avatar
  end
end
