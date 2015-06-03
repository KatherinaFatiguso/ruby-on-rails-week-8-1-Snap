class AddViewToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :view, :integer, default: 0
  end
end
