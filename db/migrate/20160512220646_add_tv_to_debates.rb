class AddTvToDebates < ActiveRecord::Migration
  def change
    add_column :debates, :tv, :string
  end
end
