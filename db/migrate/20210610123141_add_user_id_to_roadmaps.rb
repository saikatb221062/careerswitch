class AddUserIdToRoadmaps < ActiveRecord::Migration[6.0]
  def change
    add_reference :roadmaps, :user, index: true, foreign_key: true
  end
end
