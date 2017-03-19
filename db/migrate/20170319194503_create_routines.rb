class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :name
      t.decimal :frequency

      t.timestamps null: false
    end
  end
end
