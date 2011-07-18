class AddUserIdToMembers < ActiveRecord::Migration
  def self.up
  	add_column :members, :user_id, :integer
    add_index :members, :user_id
  end

  def self.down
  	remove_column :members, :user_id
  end
end
