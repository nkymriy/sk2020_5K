# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

IdeaCategory.create(:idea_category_name => 'メモ')
IdeaCategory.create(:idea_category_name => 'ブレインストーミング')

if Rails.env.development?
  User.create(:email => "develop@example.com",
              :created_at => "2020-08-31",
              :updated_at => "2020-08-31",
              :password => "password",
              :confirmed_at => "2020-8-31"
  )
  User.create(:email => "develop2@example.com",
              :created_at => "2020-08-31",
              :updated_at => "2020-08-31",
              :password => "password",
              :confirmed_at => "2020-8-31"
  )


  Idea.create(:idea_name => "test1", :idea_description => "example_idea", :idea_category_id => 1)
  Idea.create(:idea_name => "test2", :idea_description => "example_idea", :idea_category_id => 1)
  Idea.create(:idea_name => "test3", :idea_description => "example_idea", :idea_category_id => 1)
  Idea.create(:idea_name => "test4", :idea_description => "example_idea", :idea_category_id => 1)
  UserIdea.create(:user_id => 1, :idea_id => 1)
  UserIdea.create(:user_id => 1, :idea_id => 3)
  UserIdea.create(:user_id => 2, :idea_id => 2)
  UserIdea.create(:user_id => 2, :idea_id => 4)
end