class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :photographer, foreign_key: true
      t.string :photo
      t.timestamps
    end
  end
end
