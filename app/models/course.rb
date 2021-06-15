class Course < ApplicationRecord
  belongs_to :topic
  has_many :course_roadmaps, dependent: :destroy 
end
