class RemoveCategoriesFromPhotographers < ActiveRecord::Migration[5.1]
  def change
    remove_column :photographers, :categories
  end
end
