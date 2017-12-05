class ApplicationsController < ApplicationController
  before_action :set_application, :only => [:new, :create, :show, :edit, :update]

  def index
      if params[:application]
        @applicants = Application.search(params[:application])
      else
        @applicants = Application.all
      end
      @intern = InternshipUpdate.new


  end

  def new
    @application = Application.new
  end

  def create
    @application = current_user.create_application(params_application)

    if @application.save
      redirect_to edit_application_path(@application)
    else
      render :new
    end
  end

  def update
    if @application.update(params_application)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def params_application
    params.require(:application).permit(:district_id, :sector_id, :phone_number, :bank_id, :bank_number, :is_female, :internship_placement, :field_of_study_id, :user_id)
  end

  def set_application
    @user = current_user
    @application = @user.application
  end
end
