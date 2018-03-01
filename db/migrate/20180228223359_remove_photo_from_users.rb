class RemovePhotoFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :photo
  end
end
