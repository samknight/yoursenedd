class CreateMotions < ActiveRecord::Migration
  def self.up
    create_table :motions do |t|
      t.string :title
      t.string :code
      t.integer :member_id
      t.text :description
      t.string :procedure
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :motions
  end
end
