class AddDurationToRoadmaps < ActiveRecord::Migration[6.0]
  def change
    add_column :roadmaps, :duration, :integer
  end
end
