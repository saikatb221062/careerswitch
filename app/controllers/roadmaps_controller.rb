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
    @my_roadmap = Roadmap.new
  end

  def create
    @courses = params[:roadmap][:courses]
    @courses.each do |course|
      @course = Course.find(course)
      puts @course.title
    end
    @my_roadmap = Roadmap.new
    @my_courses = @my_roadmap.courses
    @my_roadmap.privacy_option = false
    @my_roadmap.start_date = Date.today
    @my_roadmap.end_date = @my_roadmap.start_date + (current_user.timeframe).months
    @my_roadmap.duration = (@my_roadmap.start_date..@my_roadmap.end_date).to_a.group_by(&:month).count
    @my_roadmap.user = current_user
    if @my_roadmap.save
      redirect_to builder_roadmaps_path
    end
  end

  def mybuilder
    @my_roadmap = current_user.roadmap
    @course_roadmaps = CourseRoadmap.where(roadmap: @my_roadmap)
    @courses = CourseRoadmap.where(roadmap: @my_roadmap).map(&:course)
    @my_courses = @my_roadmap.courses
  end

end
