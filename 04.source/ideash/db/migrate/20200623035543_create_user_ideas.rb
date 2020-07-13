class CreateUserIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :user_ideas do |t|

      t.belongs_to :user, foreign_key: true
      t.belongs_to :idea, foreign_key: true
      t.timestamps
    end
  end
end
