class InternshipUpdatesController < ApplicationController
  
  def new
    @intern = InternshipUpdate.new
  end

  def create
    @intern = InternshipUpdate.new(params_interns)

    if @intern.save
      @intern.application.update(internship_placement: true )
      redirect_to applications_path
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
end
