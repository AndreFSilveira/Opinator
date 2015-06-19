class RemoveFieldNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    remove_column :users, :password, :string
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string 
  end
end
