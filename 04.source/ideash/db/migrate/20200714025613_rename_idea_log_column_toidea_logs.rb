class RenameIdeaLogColumnToideaLogs < ActiveRecord::Migration[6.0]
  def change
    rename_column :idea_logs, :idea_log, :query
  end
end
