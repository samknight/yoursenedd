class AddMotionIdToVote < ActiveRecord::Migration
  def self.up
    add_column :votes, :motion_id, :integer
  end

  def self.down
    remove_column :votes, :motion_id
  end
end
