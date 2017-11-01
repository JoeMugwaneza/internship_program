class SurveysController < ApplicationController
  before_action :find_survey, :only => [:show, :edit, :update, :destory]
  before_action :find_user, :only => [:show, :edit, :update, :destory]
  
  def index
    @surveys = Survey.all
    find_survey
  end

  def show
    @answers = @survey.answers.order('created_at ASC')
  end

  def new
    @survey = Survey.new
    @survey.answers.build
  end

  def create
    @survey = current_user.surveys.build(survey_params)

    if @survey.save
      redirect_to survey_path(@survey), notice: "Survey was successfully created"
    else
      render :new
    end
  end

  def update
    if @survey.update_attributes(survey_params)
      redirect_to @survey, notice: "Survey was successfully updated"
    else 
      render :edit
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
      redirect_to root_url
  end

  private

  def survey_params
    params.require(:survey).permit(:name, :user_id,  answers_attributes: [:id, :content, :survey_id, :question_id])
  end

  def find_survey
    @survey = Survey.find_by(id: params[:id])
  end

  def find_user
    @user = @survey.user
  end
end
