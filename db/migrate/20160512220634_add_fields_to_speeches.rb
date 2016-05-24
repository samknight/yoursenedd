class AddFieldsToSpeeches < ActiveRecord::Migration
  def change
    add_column :speeches, :content_cy, :text
    add_column :speeches, :tv, :string
  end
end
