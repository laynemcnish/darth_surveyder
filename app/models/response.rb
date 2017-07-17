# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  survey_id  :integer
#  answer     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  belongs_to :user
  belongs_to :survey
end
