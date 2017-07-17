# == Schema Information
#
# Table name: surveys
#
#  id          :integer          not null, primary key
#  question    :string           not null
#  user_id     :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :survey do
    question Faker::StarWars.wookie_sentence
    user { create(:user) }
    category { create(:category) }
  end
end
