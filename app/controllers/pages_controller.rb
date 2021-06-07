class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home results]

  def home
  end

  def results
    @industry_to = params[:query_to]
    @industry_from = params[:query_from]

    if current_user.nil?
      @results = User.all
    else
      @results = User.where.not(id: current_user.id)
    end

    @search_filter_to = @results.where("future_role ~* ?", @industry_to)
    @users = @search_filter_to.where("current_industry ~* ?", @industry_from)

    if @results.empty?
      @shortlisted_profiles = @results
      @shortlist_msg = 'We could not find any matches!'
    elsif @users.empty?
      @shortlisted_profiles = @search_filter_to
      @shortlist_msg = 'We could not find exact matches for your current industry but you may want to look up these....'
    else
      @shortlisted_profiles = @users
      @shortlist_msg = 'Here are profiles that exactly match your search !'
    end
  end
end
