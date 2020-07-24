class ChangeHashLinkFromIdeas < ActiveRecord::Migration[6.0]
  def change
    add_index :ideas, :hash_link, unique: true
  end
end
