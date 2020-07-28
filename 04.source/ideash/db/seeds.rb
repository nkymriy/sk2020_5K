# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

idea_categories = [['メモ','memo'],
                   ['ブレインストーミング','brainstorming']]
p "== create idea_categories ==================="
for category in idea_categories do
  IdeaCategory.create!(:idea_category_name => category[0],
                       :manage_name => category[1])
end

p "== create users ============================="
(1..10).each do |i|
  User.create!(
      :email => "develop#{i}@example.com",
      :password => "password",
      :confirmed_at => "2020-8-31"
  )
end
p "== create ideas, user_ideas, idea_logs ======"
(1..10).each do |i|
  idea = Idea.create!(
      :idea_name => "sample_idea ##{i}",
      :idea_description => "example ##{i}",
      :idea_category_id => 1
  )

  (1..2).each do |j|
    UserIdea.create!(:idea_id => idea.id, :user_id => j)
  end
  50.times do |j|
    idea.idea_logs.create!(
        :query => {
            :object => j,
            :user_id => 1,
            :mode => 'add',
            :add => {
                :content => "sample content ##{j}"
            },
            :time => "#{Time.now + j}"
        }
    )
  end
end