class CreateIdeaCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :idea_categories do |t|

      t.string :idea_category_name, null: false
      t.timestamps
    end
    add_index :idea_categories, [:idea_category_name], unique: true
  end
end
