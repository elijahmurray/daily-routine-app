class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.text :notes
      t.date :date
      t.references :connection, index: true

      t.timestamps null: false
    end
    add_foreign_key :meetings, :connections
  end
end
