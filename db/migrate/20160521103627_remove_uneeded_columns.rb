class RemoveUneededColumns < ActiveRecord::Migration
  def up
    remove_column :constituencies, :number_of_members
    remove_column :debates, :debate_type
    remove_column :debates, :motion
    remove_column :debates, :member_id
    remove_column :debates, :motion_id
    remove_column :members, :initials
    remove_column :members, :image_file_name
    remove_column :members, :image_content_type
    remove_column :members, :image_file_size
    remove_column :members, :image_updated_at
    drop_table :motions
    drop_table :proposers
    drop_table :opinions
    drop_table :votes
  end
end
