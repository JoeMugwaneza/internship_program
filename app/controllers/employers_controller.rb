class EmployersController < ApplicationController
  def index
    @employers = Employer.all
  end
  
  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(params_employer)

    if @employer.save
      redirect_to employer_path(@employer)
    else
      render :new
    end
  end

private

  def params_employer
    params.require(:employer).permit(:first_name, :last_name, :phone_number, :company_name, :company_website, :available_at, :number_of_interns, :stipend_amount)
  end
end
