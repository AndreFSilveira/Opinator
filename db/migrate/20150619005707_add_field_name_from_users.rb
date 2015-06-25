class AddFieldNameFromUsers < ActiveRecord::Migration
  def change
  	add_column :users, :logged, :boolean
  end
end
