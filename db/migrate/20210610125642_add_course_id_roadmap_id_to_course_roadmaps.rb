class AddCourseIdRoadmapIdToCourseRoadmaps < ActiveRecord::Migration[6.0]
  def change
    add_reference :course_roadmaps, :course, index: true, foreign_key: true
    add_reference :course_roadmaps, :roadmap, index: true, foreign_key: true
  end
end
