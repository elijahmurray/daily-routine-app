class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.date :due_date
      t.text :description

      t.timestamps null: false
    end
  end
end
