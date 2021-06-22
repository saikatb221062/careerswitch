class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home results]

  def home
  end

  def dashboard
    @user = current_user
  end

  def networks
    if current_user.nil?
      @connections = Connection.none
    else
      @connections = Connection.where(connecting_id: current_user.id) + Connection.where(connected_id: current_user.id)
    end
  end

  def results
    @industry_to = params[:query_to]
    @industry_from = params[:query_from]
    @role_from = params[:query_role]

    if current_user.nil?
      @results = User.all
    else
      @results = User.all.where.not(id: current_user.id)
    end

    @search_filter_to = @results.where(future_role: @industry_to)
    @search_filter_from = @search_filter_to.where("current_industry ~* ?", @industry_from)
    @search_filter_role = @search_filter_from.where(current_role: @role_from)

    # Saikat's code - commented
    # if @search_filter_to.empty?
    #   @shortlisted_profiles = @search_filter_to
    #   @shortlist_msg = 'Sorry, we could not find any matches for your search'
    # elsif @search_filter_role.empty?
    #   @shortlisted_profiles = @search_filter_to
    #   @shortlist_msg = 'We could not find exact matches for you but you may want to # look up these similar profiles'
    # else
    #   @shortlisted_profiles = @search_filter_role
    #   @shortlist_msg = 'Here are profiles that exactly match your search !'
    # end

    # Nicole's code - re-instated 19-Jun
    if @industry_to.empty? && @industry_from.empty? && @role_from.empty?
      @shortlisted_profiles = @results
      @shortlist_msg = 'Please do not leave the search empty!'
    elsif @industry_to.empty? || @industry_from.empty? || @role_from.empty?
      @shortlisted_profiles = @results
      @shortlist_msg = 'For better search result, please do not leave any field empty!'
    elsif @search_filter_to.empty?
      @shortlisted_profiles = @results
      @shortlist_msg = "Sorry there's no exact match from your search, however, you can be the pioneer in this path and there may be people who wish to be like you in the future. Here's a closer role you may be interested in!"
    elsif @search_filter_role.empty?
      @shortlisted_profiles = @search_filter_to + @search_filter_from
      @shortlisted_profiles = @shortlisted_profiles.uniq
      @shortlist_msg = 'We could not find exact matches for your current industry but you may want to look up these....'
    else
      @shortlisted_profiles = @search_filter_role.uniq
      @shortlist_msg = 'Here are profiles that exactly match your search !'
    end
  end
end
