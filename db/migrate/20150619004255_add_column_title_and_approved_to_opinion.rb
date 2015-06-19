class AddColumnTitleAndApprovedToOpinion < ActiveRecord::Migration
  def change
    add_column :opinions, :title, :string
    add_column :opinions, :approved, :boolean
  end
end
