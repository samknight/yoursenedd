class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :member_id
      t.integer :party_id
      t.date :log_date

      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
