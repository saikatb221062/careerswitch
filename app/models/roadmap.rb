class Roadmap < ApplicationRecord
  belongs_to :user

  has_many :course_roadmaps, dependent: :destroy
  has_many :courses, through: :course_roadmaps

  def self.suggested_roadmaps(user)
    self.joins(:user).where(users: {
      future_role: user.future_role 
    })
  end
end
