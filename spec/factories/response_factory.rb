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

FactoryGirl.define do
  factory :response do
    survey { create(:survey) }
    user { create(:user) }
    answer { Faker::Boolean }
  end
end
