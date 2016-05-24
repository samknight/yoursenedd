class RemoveUsersFields < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    remove_column :users, :encrypted_password, :string
    remove_column :users, :password_salt, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :remember_token, :string
    remove_column :users, :remember_created_at, :datetime
    remove_column :users, :sign_in_count, :integer
    remove_column :users, :current_sign_in_at, :datetime
    remove_column :users, :last_sign_in_at, :datetime
    remove_column :users, :current_sign_in_ip, :string
    remove_column :users, :last_sign_in_ip, :string
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
  end
end
