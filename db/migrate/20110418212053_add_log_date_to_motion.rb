class AddLogDateToMotion < ActiveRecord::Migration
  def self.up
    add_column :motions, :log_date, :datetime
  end

  def self.down
    remove_column :motions, :log_date
  end
end
