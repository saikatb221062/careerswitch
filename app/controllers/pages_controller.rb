class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def results
    @industry_to = params[:query_to]
    @industry_from = params[:query_from]
    
    @results = User.where.not(id:current_user.id)
    @search_filter_to = @results.where("future_role ~* ?", @industry_to)
    @users = @search_filter_to.where("current_industry ~* ?", @industry_from)
  end
end
