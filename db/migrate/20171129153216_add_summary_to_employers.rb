class AddSummaryToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :summary, :text
  end
end
