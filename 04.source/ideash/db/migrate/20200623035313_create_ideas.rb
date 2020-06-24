class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|

      t.integer :idea_category_id, foreign_key: true
      t.string :idea_name
      t.string :idea_description
      t.timestamps
    end
  end
end
