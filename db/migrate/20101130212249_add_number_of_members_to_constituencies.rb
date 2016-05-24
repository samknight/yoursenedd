class AddNumberOfMembersToConstituencies < ActiveRecord::Migration
  def self.up
    add_column :constituencies, :number_of_members, :integer
  end

  def self.down
    remove_column :constituencies, :number_of_members
  end
end
