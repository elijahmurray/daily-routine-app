class CreateRoutineItems < ActiveRecord::Migration
  def change
    create_table :routine_items do |t|
      t.string :type
      t.boolean :complete
      t.string :detail

      t.timestamps null: false
    end
  end
end
