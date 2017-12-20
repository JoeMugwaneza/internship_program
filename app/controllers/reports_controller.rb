class ReportsController < ApplicationController
  before_action :find_and_load_report, :only => [:show, :edit, :update, :destory]

  def index
    @reports = Report.all.group_by {|report| report.created_at.strftime("%B, %Y")}
  end

  def new
    @report = Report.new
      @report.key_activities.build
      @report.solutions.build
      @report.challenges.build
      @report.results.build
  end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to edit_report_path(@report)
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to user_path(current_user)
  end

  private

  def report_params
    params.require(:report).permit(:name, :user_id, :due_date, key_activities_attributes: [:id, :report_id, :activity_name], results_attributes: [:id, :report_id, :result_name], challenges_attributes: [:id, :report_id, :challenge_name], solutions_attributes: [:id, :report_id, :solution_name])
  end

  def find_and_load_report
    @report = Report.find(params[:id])
  end

end
