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
    @intern = InternshipUpdate.new(params_interns)

    if @intern.save
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
