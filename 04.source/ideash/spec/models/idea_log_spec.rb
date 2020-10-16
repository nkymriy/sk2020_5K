# == Schema Information
#
# Table name: idea_logs
#
#  id         :integer          not null, primary key
#  idea_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_active  :boolean          default(FALSE), not null
#  query      :json
#
require 'rails_helper'

RSpec.describe IdeaLog, type: :model do
  context 'idea_log' do
    let(:idea_logs){create(:idea_logs)}
    it 'is valid' do
      console(idea_logs)
    end
  end
end
