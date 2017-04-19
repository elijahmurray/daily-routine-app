class CreateRoutineLogs < ActiveRecord::Migration
  def change
    create_table :routine_logs do |t|
      t.references :routine, index: true

      t.timestamps null: false
    end
    add_foreign_key :routine_logs, :routines
  end
end
