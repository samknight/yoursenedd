class AddLogDateToRoles < ActiveRecord::Migration
  def self.up
    add_column :roles, :log_date, :date
  end

  def self.down
    remove_column :roles, :log_date
  end
end
