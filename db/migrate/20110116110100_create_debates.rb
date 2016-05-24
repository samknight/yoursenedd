class CreateDebates < ActiveRecord::Migration
  def self.up
    create_table :debates do |t|
      t.string :name
      t.string :debate_type
      t.string :motion
      t.integer :member_id
      t.date :log_date

      t.timestamps
    end
  end

  def self.down
    drop_table :debates
  end
end
