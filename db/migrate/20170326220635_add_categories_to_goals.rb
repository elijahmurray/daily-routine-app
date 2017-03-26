class AddCategoriesToGoals < ActiveRecord::Migration
  def up
    add_column :goals, :category, :string
  end

  def down
    remove_column :goals, :category
  end
end
