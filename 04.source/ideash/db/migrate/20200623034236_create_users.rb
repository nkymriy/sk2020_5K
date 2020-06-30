class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :user_name, null: false
      t.string :user_mail, null: false
      t.timestamps
    end
    add_index :users, [:user_mail], unique: true
  end
end
