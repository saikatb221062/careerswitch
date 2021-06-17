class RoadmapsController < ApplicationController
  def roadmaps
  end

  def show
    @roadmap = Roadmap.find(params[:id])
    @courses = @roadmap.courses
  end

  def suggested
    # get all roadmaps where roadmap user is not the current user
    # and roadmap user future role = current user future role


    @roadmaps = Roadmap.all.joins(:user).where(users: {
      future_role: current_user.future_role 
    })
  end

  def builder
    @roadmap = Roadmap.find(params[:id])
    @course_roadmaps = CourseRoadmap.where(roadmap: @roadmap)
    @courses = CourseRoadmap.where(roadmap: @roadmap).map(&:course)
  end
end
