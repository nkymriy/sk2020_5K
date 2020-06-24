class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|

      t.t.belongs_to :idea_category, foreign_key: true
      t.string :idea_name
      t.string :idea_description
      t.timestamps
    end
  end
end
