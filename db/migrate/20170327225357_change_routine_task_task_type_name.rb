class ChangeRoutineTaskTaskTypeName < ActiveRecord::Migration
  def change
    rename_column :routine_tasks, :task_type, :requires_response
  end
end
