class DashboardsController < ApplicationController
  before_action :authenticate_user!, :only => [:index]
  def index
    @users = User.joins(:application)
  end
end
