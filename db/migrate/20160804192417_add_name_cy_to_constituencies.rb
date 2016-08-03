class AddNameCyToConstituencies < ActiveRecord::Migration
  def change
    add_column :constituencies, :name_cy, :string
  end
end
