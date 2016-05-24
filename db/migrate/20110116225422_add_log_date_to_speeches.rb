class AddLogDateToSpeeches < ActiveRecord::Migration
  def self.up
    add_column :speeches, :log_date, :date
  end

  def self.down
    remove_column :speeches, :log_date
  end
end
