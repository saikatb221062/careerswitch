class ChangeConnectedId < ActiveRecord::Migration[6.0]
  def change
    rename_column :connections, :connected_id, :connecter_id
  end
end
