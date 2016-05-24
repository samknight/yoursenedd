class AddStartDateToConstituencies < ActiveRecord::Migration
  def self.up
    add_column :constituencies, :start_date, :date
  end

  def self.down
    remove_column :constituencies, :start_date
  end
end
