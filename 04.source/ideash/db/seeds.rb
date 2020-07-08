# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:user_name => 'テスト太郎1', :user_mail => 'testtaro1@test.com')
User.create(:user_name => 'TestTaro2', :user_mail => 'testtaro2@test.com')
IdeaCategory.create(:idea_category_name => 'メモ')
IdeaCategory.create(:idea_category_name => 'ブレインストーミング')
UserIdea.create(:user_id => 1, :idea_id => 1)
UserIdea.create(:user_id => 1, :idea_id => 3)
UserIdea.create(:user_id => 2, :idea_id => 2)
UserIdea.create(:user_id => 2, :idea_id => 4)