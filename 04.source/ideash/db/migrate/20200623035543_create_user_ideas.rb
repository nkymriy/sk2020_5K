class CreateUserIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :user_ideas do |t|
      t.integer :user_id, foreign_key: true
      t.integer :idea_id, foreign_key: true
      t.timestamps
    end
  end
end
