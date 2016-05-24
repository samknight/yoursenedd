class AddEndLogDateToRoles < ActiveRecord::Migration
  def self.up
    add_column :roles, :end_log_date, :date
  end

  def self.down
    remove_column :roles, :end_log_date
  end
end
