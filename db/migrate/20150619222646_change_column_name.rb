class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :idFacebook, :uid
  end
end
