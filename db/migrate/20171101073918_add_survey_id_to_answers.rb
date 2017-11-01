class AddSurveyIdToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :survey_id, :integer
  end
end
