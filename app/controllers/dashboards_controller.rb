class DashboardsController < ApplicationController
  before_action :authenticate_user!, :only => [:index]
  def index
    # @users = User.joins(:application)

    @filterrific = initialize_filterrific(
      Application, 
      params[:filterrific],
      select_options: {
        sorted_by: Application.options_for_sorted_by, 
        with_district_id: District.options_for_select
      }

      ) || return

    @applications = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.json
    end

  rescue ActiveRecord::RecordNotFound => e
      puts "had to reset filterrific params: #{e.message}"
      redirect_to(reset_filterrific_url(format: :html)) and return
  end
end