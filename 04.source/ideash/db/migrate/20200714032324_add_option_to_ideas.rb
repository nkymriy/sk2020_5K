class AddOptionToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :option, :json
  end
end
