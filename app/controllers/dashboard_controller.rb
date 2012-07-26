class DashboardController < ApplicationController
  def index
    @title = "Dashboard"
    @user = current_user
  end

end
