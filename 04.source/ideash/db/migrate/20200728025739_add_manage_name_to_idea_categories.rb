class AddManageNameToIdeaCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :idea_categories, :manage_name, :string
  end
end
