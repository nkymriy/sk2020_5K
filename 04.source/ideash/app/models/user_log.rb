# == Schema Information
#
# Table name: user_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserLog < ApplicationRecord
end
