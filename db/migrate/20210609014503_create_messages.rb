class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :reaction
      t.references :user, null: false, foreign_key: true
      t.references :connection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
