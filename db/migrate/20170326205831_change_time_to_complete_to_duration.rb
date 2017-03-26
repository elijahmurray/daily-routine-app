class ChangeTimeToCompleteToDuration < ActiveRecord::Migration
  def up
    change_table :goals do |t|
      t.change :time_to_complete, :integer
    end

    rename_column :goals, :time_to_complete, :duration
  end

  def down
    change_table :goals do |t|
      t.change :duration, :string
    end

    rename_column :goals, :duration, :time_to_complete
  end
end
