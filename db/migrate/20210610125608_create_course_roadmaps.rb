class CreateCourseRoadmaps < ActiveRecord::Migration[6.0]
  def change
    create_table :course_roadmaps do |t|
      t.string :status

      t.timestamps
    end
  end
end
