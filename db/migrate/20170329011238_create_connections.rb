class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :first_name
      t.string :last_name
      t.string :type
      t.text :notes
      t.datetime :last_contact
      t.datetime :follow_up_date

      t.timestamps null: false
    end
  end
end
