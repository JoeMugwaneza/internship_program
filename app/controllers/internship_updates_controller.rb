class InternshipUpdatesController < ApplicationController

  def index
    @interns = InternshipUpdate.all
  end

  def show
    
  end

  def new
    @intern = InternshipUpdate.new
  end

  def create
    @employer = InternshipUpdate.find_by(id: params[:employer_id])
    jdjkkdkkddd
    @intern = InternshipUpdate.new(params_interns)

    if @intern.save
      @intern.application.update_attribute(internship_placement: true )
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
    params.require(:Internship_update).permit(:starting_at, :chain_value_id, :applicaton_id, :employer_id)
  end
end
