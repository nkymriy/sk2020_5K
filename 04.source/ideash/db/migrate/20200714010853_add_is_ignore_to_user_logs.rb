class AddIsIgnoreToUserLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :user_logs, :is_ignore, :boolean, :default => false, :null => false
  end
end
