class AddMotionIdToDebate < ActiveRecord::Migration
  def self.up
    add_column :debates, :motion_id, :integer
  end

  def self.down
    remove_column :debates, :motion_id
  end
end
