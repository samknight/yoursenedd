class AddTvCyToDebates < ActiveRecord::Migration
  def change
    add_column :debates, :tv_cy, :string
  end
end
