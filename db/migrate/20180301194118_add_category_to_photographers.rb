class AddCategoryToPhotographers < ActiveRecord::Migration[5.1]
  def change
    add_column :photographers, :category, :string
  end
end
