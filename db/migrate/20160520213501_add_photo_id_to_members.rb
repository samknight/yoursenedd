class AddPhotoIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :photo_id, :string
  end
end
