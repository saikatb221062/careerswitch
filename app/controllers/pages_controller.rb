class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
  end

  def networks
  end
end
