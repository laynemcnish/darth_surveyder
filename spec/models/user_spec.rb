# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  rank       :string           default("Lieutenant"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it {is_expected.to have_many(:surveys)}
    it {is_expected.to have_many(:responses)}
  end

  context 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:rank)}
  end
end
