class ChangeRoutineTaskTaskTypeToBoolean < ActiveRecord::Migration
  def change
    change_table :routine_tasks do |t|
      t.change :task_type, :boolean
    end
  end
end
