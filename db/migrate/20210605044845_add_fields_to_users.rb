class AddFieldsToUsers < ActiveRecord::Migration[6.0]
    def change
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :budget, :integer
      add_column :users, :timeframe, :integer
      add_column :users, :current_role, :string
      add_column :users, :current_industry, :string
      add_column :users, :future_role, :string
      add_column :users, :future_industry, :string
      add_column :users, :available_hrs_per_week, :integer
      add_column :users, :status, :string
    end
  end