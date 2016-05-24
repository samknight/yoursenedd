class CreateSpeeches < ActiveRecord::Migration
  def self.up
    create_table :speeches do |t|
      t.integer :member_id
      t.integer :debate_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :speeches
  end
end
