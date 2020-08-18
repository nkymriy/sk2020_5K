class AddHashLinkToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :hash_link, :string
  end
end
