class AddResponseToRoutineTasks < ActiveRecord::Migration
  def change
    add_column :routine_tasks, :response, :text
  end
end
