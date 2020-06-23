class CreateIdeaCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :idea_categories do |t|

      t.timestamps
    end
  end
end
