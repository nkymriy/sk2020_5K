class AddQueryToIdealogs < ActiveRecord::Migration[6.0]
  def change
    add_column :idea_logs, :query, :json
  end
end
