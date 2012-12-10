class AddUserIdToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :user_id, :integer
  	add_index :collections, :user_id
  	remove_column :collections, :name
  end
end
