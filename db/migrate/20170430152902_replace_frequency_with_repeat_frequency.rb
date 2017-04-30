class ReplaceFrequencyWithRepeatFrequency < ActiveRecord::Migration
  def change
    add_column :routines, :repeat_frequency, :string
    remove_column :routines, :frequency
  end
end
