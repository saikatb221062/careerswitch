class RemoveUserFromConnections < ActiveRecord::Migration[6.0]
  def change
    remove_column :connections, :user_id
  end
end
