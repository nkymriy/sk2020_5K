# == Schema Information
#
# Table name: ideas
#
#  id               :string           not null, primary key
#  idea_category_id :integer
#  idea_name        :string
#  idea_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  option           :json
#  hash_link        :string
#
class Idea < ApplicationRecord
  before_create :set_id

  has_many :idea_logs
  has_many :user_idea
  has_many :user, through: :user_idea

  private

  def set_id
    # idが未設定 or 既に設定されている
    while self.id.blank? || User.find_by(id: self.id).present? do
      # 乱数20桁を設定
      self.id = SecureRandom.alphanumeric(20)
    end
  end

end