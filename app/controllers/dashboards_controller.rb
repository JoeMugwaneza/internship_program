class DashboardsController < ApplicationController
  before_action :authenticate_user!, :only => [:index]

   def index
    if params[:application] && params[:application][:field_of_study_id].empty? && params[:application][:district_id].empty? && params[:application][:sector_id].empty?

      @applicants = Application.all

    elsif params[:application]
      @applicants = Application.search(params[:application])
    else
      @applicants = Application.all
    end
  end

end