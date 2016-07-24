class AddSpokeAtToSpeeches < ActiveRecord::Migration
  def change
    add_column :speeches, :spoke_at, :datetime
  end
end
