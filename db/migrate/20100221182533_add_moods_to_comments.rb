class AddMoodsToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :mood_id, :integer
  end

  def self.down
    remove_column :comments, :mood_id
  end
end
