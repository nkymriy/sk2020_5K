class CreateUserLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_logs do |t|

      t.belongs_to :user, foreign_key: true
      # t.timestamps :user_log_login_at
      t.timestamps
    end
  end
end
