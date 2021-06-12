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
    sql_query = <<-SQL
    SELECT * FROM roadmaps INNER JOIN users ON users.id = roadmaps.user_id WHERE roadmaps.user_id <> '#{current_user.id}' AND users.future_role = '#{current_user.future_role}'
    SQL

    @roadmaps = Roadmap.find_by_sql(sql_query)
  end

  def builder
  end
end
