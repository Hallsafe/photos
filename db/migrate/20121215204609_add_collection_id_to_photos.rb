class AddCollectionIdToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :collection_id, :integer
  	add_index :photos, :collection_id
  end
end
