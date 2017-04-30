class UpdateRoutineTasksForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :routine_tasks, :routines
    remove_foreign_key :routine_logs, :routines

    add_foreign_key :routine_tasks, :routines, on_delete: :cascade
    add_foreign_key :routine_logs, :routines, on_delete: :cascade
  end
end
