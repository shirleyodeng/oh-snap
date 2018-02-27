class RemoveCategoriesArrayFromPhotographers < ActiveRecord::Migration[5.1]
  def change
    change_column :photographers, :categories, :string, array: false
  end
end
