# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) {build(:category)}

  context 'associations' do
    it {is_expected.to have_many(:surveys)}
  end

  context 'validations' do
    it {is_expected.to validate_presence_of(:name)}
  end

  context "#after_commit" do
    subject {category.save!}

    it "reindexes surveys" do
      expect(Survey).to receive(:reindex)
      subject
    end
  end
end
