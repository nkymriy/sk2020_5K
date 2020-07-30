# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "pp"
idea_categories = [['メモ', 'memo'],
                   ['ブレインストーミング', 'brainstorming'],
                   ['マンダラート', 'mandarat']]
pp "== create idea_categories ==================="
for category in idea_categories do
  if IdeaCategory.find_by(manage_name: category[1])
    pp "Skip: category #{category[0]}(#{category[1]})は登録されています。"
    next
  end
  pp IdeaCategory.create!(:idea_category_name => category[0],
                          :manage_name => category[1])
end
if Rails.env.development?
  pp "== debug data ==============================="
  pp "== create users ============================="
  (1..10).each do |i|
    pp User.create!(
        :email => "develop#{i}@example.com",
        :password => "password",
        :confirmed_at => "2020-8-31"
    )
  end
  pp "== create ideas, user_ideas, idea_logs ======"
  (1..10).each do |i|
    pp idea = Idea.create!(
        :idea_name => "sample_idea ##{i}",
        :idea_description => "example ##{i}",
        :idea_category_id => 1
    )

    (1..2).each do |j|
      pp UserIdea.create!(:idea_id => idea.id, :user_id => j)
    end
    pp "create 50times idea_log ##{idea}"
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
  pp 'db:seed success!!!'
end