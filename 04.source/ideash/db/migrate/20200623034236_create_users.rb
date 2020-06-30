class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :user_name, null: false
      t.string :user_mail, null: false, unique: true
      t.timestamps
    end
  end
end
