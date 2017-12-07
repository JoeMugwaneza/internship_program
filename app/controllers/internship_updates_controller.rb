class InternshipUpdatesController < ApplicationController
  before_action :set_employer, :only => [:new, :create, :edit, :update]
  before_action :authenticate_user!, :only => [:index]
  
  def new
    @intern = InternshipUpdate.new
  end

  def create
    @intern = InternshipUpdate.new(params_interns)

    if @intern.save
      @intern.application.update(internship_placement: true)

      if @employer.number_of_interns == InternshipUpdate.includes(:employers).where(employer_id: params[:internship_update][:employer_id].to_i).size
        @employer.update(closed: true)
      end
      redirect_to employers_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    
  end

  private

  def params_interns
    params.require(:internship_update).permit(:starting_at, :chain_value_id, :application_id, :employer_id)
  end

  def set_employer
    @employer = Employer.find(params[:internship_update][:employer_id].to_i)
  end

end
