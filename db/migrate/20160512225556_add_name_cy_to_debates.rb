class AddNameCyToDebates < ActiveRecord::Migration
  def change
    add_column :debates, :name_cy, :string
  end
end
