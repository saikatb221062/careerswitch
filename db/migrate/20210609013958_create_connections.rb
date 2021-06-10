class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :connecting_id
      t.integer :connected_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
