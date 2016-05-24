class CreateAssemblies < ActiveRecord::Migration
  def self.up
    create_table :assemblies do |t|
      t.integer :number
      t.date :start_date

      t.timestamps
    end
  end

  def self.down
    drop_table :assemblies
  end
end
