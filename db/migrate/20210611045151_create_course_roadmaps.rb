class CreateCourseRoadmaps < ActiveRecord::Migration[6.0]
  def change
    create_table :course_roadmaps do |t|
      t.string :status
      t.references :course, null: false, foreign_key: true
      t.references :roadmap, null: false, foreign_key: true

      t.timestamps
    end
  end
end
