class CreateIdeaLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :idea_logs do |t|

      t.timestamps
    end
  end
end
