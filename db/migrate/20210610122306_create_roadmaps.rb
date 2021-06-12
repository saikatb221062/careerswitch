class CreateRoadmaps < ActiveRecord::Migration[6.0]
  def change
    create_table :roadmaps do |t|
      t.boolean :privacy_option
      t.date :start_date
      t.date :end_date

      t.timestamps

    end
  end
end
