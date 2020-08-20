class RemoveQueryFromIdealogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :idea_logs, :query
  end
end
