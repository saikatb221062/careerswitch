class AddMoreFieldstoUsers < ActiveRecord::Migration[6.0]
  def change
      add_column :users, :location, :string
      add_column :users, :motivation, :text
      add_column :users, :satisfaction, :string
      add_column :users, :journey_experience, :text
      add_column :users, :advice, :text
      add_column :users, :img_url, :string
  end
end
