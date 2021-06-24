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


    @roadmaps = Roadmap.suggested_roadmaps(current_user)


    @roadmaps = Roadmap.all.joins(:user).where(users: {
      future_role: current_user.future_role 
    })
  end

  def builder
    @roadmap = Roadmap.find(params[:id])
    @courses = CourseRoadmap.where(roadmap: @roadmap).map(&:course)
    @all_courses = Course.all
    @my_roadmap = Roadmap.new
  end

  def create
    @courses = params[:roadmap][:courses]
    @my_courses = []
    @courses.each do |course|
      @course = Course.find(course)
      @my_courses << @course
    end
    @my_roadmap = Roadmap.where(user: current_user).first_or_initialize
    @my_roadmap.courses = @my_courses
    @my_roadmap.privacy_option = false
    @my_roadmap.start_date = Date.today
    @my_roadmap.end_date = @my_roadmap.start_date + (current_user.timeframe).months
    @my_roadmap.duration = (@my_roadmap.end_date.year * 12 + @my_roadmap.end_date.month) - (@my_roadmap.start_date.year * 12 + @my_roadmap.start_date.month)
    @month_array = ((@my_roadmap.start_date).month..(@my_roadmap.end_date).month)
    if @my_roadmap.save
      redirect_to builder_roadmaps_path
    end
  end

  def mybuilder
    @my_roadmap = current_user.roadmap
    @month_array = ((@my_roadmap.start_date).month..(@my_roadmap.end_date).month)
    @courses = Roadmap.suggested_roadmaps(current_user).map(&:courses).flatten.uniq
    @my_courses = @my_roadmap.courses
    @chosen_courses = @courses & @my_courses
  end

  def update
    @courses = params[:roadmap][:courses]
    @my_courses = []
    @courses.each do |course|
      @course = Course.find(course)
      @my_courses << @course
    end
    @my_roadmap = current_user.roadmap
    @my_roadmap.courses = @my_courses
    @my_roadmap.privacy_option = false
    @my_roadmap.start_date = Date.today
    @my_roadmap.end_date = @my_roadmap.start_date + (current_user.timeframe).months
    @my_roadmap.duration = (@my_roadmap.end_date.year * 12 + @my_roadmap.end_date.month) - (@my_roadmap.start_date.year * 12 + @my_roadmap.start_date.month) 
    if @my_roadmap.save
      redirect_to builder_roadmaps_path
    end
  end

end
