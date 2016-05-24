class AddEndLogDateToRepresentations < ActiveRecord::Migration
  def self.up
    add_column :representations, :end_log_date, :date
  end

  def self.down
    remove_column :representations, :end_log_date
  end
end
