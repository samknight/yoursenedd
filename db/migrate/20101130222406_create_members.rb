class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :forename
      t.string :initials
      t.string :surname

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
