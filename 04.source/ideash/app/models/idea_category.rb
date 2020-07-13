# == Schema Information
#
# Table name: idea_categories
#
#  id                 :integer          not null, primary key
#  idea_category_name :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class IdeaCategory < ApplicationRecord
  has_many :idea
end
