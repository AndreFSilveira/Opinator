class CreateAgrees < ActiveRecord::Migration
  def change
    create_table :agrees do |t|
      t.integer :opinion_id
      t.integer :comment_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
