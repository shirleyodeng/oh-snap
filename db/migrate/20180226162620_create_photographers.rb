class CreatePhotographers < ActiveRecord::Migration[5.1]
  def change
    create_table :photographers do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.string :categories, array: true
      t.string :city
      t.integer :hourly_rate
      t.string :photos, array: true

      t.timestamps
    end
  end
end
