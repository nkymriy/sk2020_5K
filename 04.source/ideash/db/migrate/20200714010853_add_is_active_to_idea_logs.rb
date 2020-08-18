class AddIsActiveToIdeaLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :idea_logs, :is_active, :boolean, :default => false, :null => false
  end
end
