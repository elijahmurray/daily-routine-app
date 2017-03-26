class ReplaceGoalsDuedateWithTimeToComplete < ActiveRecord::Migration
  def up
    change_table :goals do |t|
      t.change :due_date, :string
    end
    rename_column :goals, :due_date, :time_to_complete
  end

  def down
    change_table :goals do |t|
      t.change :time_to_complete, :date
    end
    rename_column :goals, :time_to_complete, :due_date
  end
end
