class ChangeConnectionTypeToConnectionType < ActiveRecord::Migration
  def change
    rename_column :connections, :type, :connection_type
  end
end
