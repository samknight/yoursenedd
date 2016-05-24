class AddSlugToDebates < ActiveRecord::Migration
  def change
    add_column :debates, :slug, :string
  end
end
