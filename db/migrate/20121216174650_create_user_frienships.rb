class CreateUserFrienships < ActiveRecord::Migration
  def change
    create_table :user_frienships do |t|
    	t.integer :user_id
    	t.integer :friend_id
      t.timestamps
    end

    add_index :user_frienships, [:user_id, :friend_id]
  end
end
