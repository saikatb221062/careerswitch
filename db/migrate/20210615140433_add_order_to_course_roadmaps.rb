class AddOrderToCourseRoadmaps < ActiveRecord::Migration[6.0]
  def change
    add_column :course_roadmaps, :order, :integer
  end
end
