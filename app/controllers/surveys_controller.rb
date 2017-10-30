class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def show
    find_survey
  end

  def new
    @survey = Survey.new
      4.times do
        question = @survey.questions.build
        1.times { question.answers.build }
      end
  end

  def create
    @survey = current_user.surveys.build(survey_params)

    if @survey.save
      redirect_to @survey, notice: "survey was successfully created"
    else
      render :new
    end
  end

  def edit
    find_survey
  end

  def update
    @survey.update(survey_params)
    if @survey.save 
      redirect_to @survey, notice: "Survey was successfully updated"
    else 
      render :edit
    end
  end

  def destroy
    find_survey
    @survey.destroy
      redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :user_id,  questions_attributes: [ :id, :title, answers_attributes: [ :id, :content]])
  end

  def find_survey
    @survey = Survey.find(params[:id])
  end
end
