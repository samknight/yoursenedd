class AddExternalIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :external_id, :integer
  end
end
