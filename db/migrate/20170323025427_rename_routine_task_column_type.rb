class RenameRoutineTaskColumnType < ActiveRecord::Migration
  def change
    rename_column :routine_tasks, :type, :task_type
  end
end
