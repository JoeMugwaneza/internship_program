class EmployersController < ApplicationController
  before_action :set_employer, :only => [:show, :edit, :update, :congratulations]
  before_action :authenticate_user!, :only => [:index]

  def index
    @pending_employer_requests = Employer.pending_request
    @confirmed_employer_requests = Employer.confirmed_request
  end

  def show
    set_employer
  end
  
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(params_employer)

    if @employer.save
      redirect_to edit_employer_path(@employer)
    else
      render :new
    end
  end

  def update
    if @employer.update(params_employer)
      redirect_to employer_congratulations_path(@employer)
    else 
      render :edit
    end

  end

  def congratulations
  end

private

  def params_employer
    params.require(:employer).permit(:first_name, :last_name, :phone_number, :company_name, :company_website, :available_at, :number_of_interns, :stipend_amount, :chain_value_id, :district_id, :sector_id, :email, :summary, :field_of_study_ids => [])
  end

  def set_employer
    @employer = Employer.find(params[:id])
  end
end
