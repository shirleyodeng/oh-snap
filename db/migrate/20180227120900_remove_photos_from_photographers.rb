class RemovePhotosFromPhotographers < ActiveRecord::Migration[5.1]
  def change
    remove_column :photographers, :photos
  end
end
