class ChangeRoutineTaskTaskTypeToBoolean < ActiveRecord::Migration
  def change
    change_table :routine_tasks do |t|
      t.change :task_type, 'boolean USING CAST("task_type" AS boolean)'
    end
  end
end
