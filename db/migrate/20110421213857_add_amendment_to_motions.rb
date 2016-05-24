class AddAmendmentToMotions < ActiveRecord::Migration
  def self.up
    add_column :motions, :amendment, :integer
  end

  def self.down
    remove_column :motions, :amendment
  end
end
