class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
