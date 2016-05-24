class CreateRepresentations < ActiveRecord::Migration
  def self.up
    create_table :representations do |t|
      t.integer :member_id
      t.integer :constituency_id
      t.date :log_date

      t.timestamps
    end
  end

  def self.down
    drop_table :representations
  end
end
