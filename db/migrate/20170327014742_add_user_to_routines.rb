class AddUserToRoutines < ActiveRecord::Migration
  def change
    add_reference :routines, :user, index: true
    add_foreign_key :routines, :users
  end
end
