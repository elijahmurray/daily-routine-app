class CreateRoutineTaskLogs < ActiveRecord::Migration
  def change
    create_table :routine_task_logs do |t|
      t.references :routine_log, index: true
      t.boolean :complete
      t.string :detail
      t.text :response

      t.timestamps null: false
    end
    add_foreign_key :routine_task_logs, :routine_logs
  end
end
