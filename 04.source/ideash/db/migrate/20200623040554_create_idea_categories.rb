class CreateIdeaCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :idea_categories do |t|

      t.string :idea_category_name, null: false
      t.timestamps
    end
  end
end
