class AddEndDateToConstituencies < ActiveRecord::Migration
  def self.up
    add_column :constituencies, :end_date, :date
  end

  def self.down
    remove_column :constituencies, :end_date
  end
end
