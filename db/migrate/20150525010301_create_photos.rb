class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filename
      t.text :description
      t.references :album
      t.timestamps null: false
    end
  end
end
