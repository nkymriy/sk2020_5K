require 'rails_helper'

RSpec.describe IdeaLog, type: :model do
  context 'idea_log' do
    let(:idea_logs){create(:idea_logs)}
    it 'is valid' do
      console(idea_logs)
    end
  end
end