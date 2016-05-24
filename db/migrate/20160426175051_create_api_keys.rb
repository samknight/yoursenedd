class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :uuid
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
