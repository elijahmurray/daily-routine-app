class CreateRoutineTasks < ActiveRecord::Migration
  def change
    create_table :routine_tasks do |t|
      t.string :type
      t.boolean :complete
      t.string :detail
      t.references :routine, index: true

      t.timestamps null: false
    end
    add_foreign_key :routine_tasks, :routines
  end
end
