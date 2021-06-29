class CourseRoadmapsController < ApplicationController
  def destroy
    course_roadmap = CourseRoadmap.find(params[:id])
    if course_roadmap.destroy
      redirect_to builder_roadmaps_path(notice: "The course has been removed")
    end
  end
end
