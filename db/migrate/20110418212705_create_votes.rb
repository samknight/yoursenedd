class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :member_id
      t.string :code
      t.string :sway

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
