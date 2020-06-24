class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|

      t.string :user_id, foreign_key: true
      t.string :memo_content
      t.timestamps
    end
  end
end
