class Roadmap < ApplicationRecord
  belongs_to :user

  has_many :course_roadmaps, dependent: :destroy 
  has_many :courses, through: :course_roadmaps
end
