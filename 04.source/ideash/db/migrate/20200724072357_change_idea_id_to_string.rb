class ChangeIdeaIdToString < ActiveRecord::Migration[6.0]
  def up
    change_column :ideas, :id, :string
    change_column :user_ideas, :idea_id, :string
    change_column :idea_logs, :idea_id, :string
  end

  def down
    change_column :ideas, :id, :integer
    change_column :user_ideas, :idea_id, :integer
    change_column :idea_logs, :idea_id, :integer
  end
end
