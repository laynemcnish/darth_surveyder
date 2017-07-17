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

require 'rails_helper'

RSpec.describe Survey, type: :model do
  let(:category1) {create(:category, name: 'World domination')}
  let(:category2) {create(:category, name: 'Intergalactic alliances')}
  let(:category3) {create(:category, name: 'Misc')}
  let(:survey1) {create(:survey, question: 'Are you our only hope?', category: category1)}
  let(:survey2) {create(:survey, question: 'Are you a member of the Rebel alliance?', category: category2)}
  let(:survey3) {create(:survey, question: 'Do you know where in the world is Carmen San Diego?', category: category3)}
  let(:survey4) {create(:survey, question: 'Do wookies like cookies?', category: category3)}

  context 'associations' do
    it {is_expected.to belong_to(:category)}
    it {is_expected.to belong_to(:user)}
    it {is_expected.to have_many(:responses)}
  end

  context 'validations' do
    it {is_expected.to validate_presence_of(:user)}
    it {is_expected.to validate_presence_of(:question)}
    it {is_expected.to validate_presence_of(:category)}
  end

  context 'searching' do
    before do
      survey1; survey2; survey3; survey4
      Survey.reindex
    end

    subject {Survey.search('world')}

    describe 'searchable by question' do
      it 'returns surveys containing the search parameters' do
        expect(subject).to include(survey3)
      end

      it 'does not return surveys excluding the search parameters' do
        expect(subject).not_to include(survey4, survey2)
      end
    end

    describe 'searchable by category' do
      it 'returns surveys containing the search parameters' do
        expect(subject).to include(survey1)
      end

      it 'does not return surveys excluding the search parameters' do
        expect(subject).not_to include(survey4, survey2)
      end
    end
  end

  describe 'calculating response ratios' do
    context 'when there are no responses' do
      it 'returns 0' do
        expect(survey1.positive_response_ratio).to eq(0)
        expect(survey1.negative_response_ratio).to eq(0)
      end
    end

    context 'when there are responses' do
      before do
        create(:response, survey: survey1, answer: true)
        create(:response, survey: survey1, answer: false)
        create(:response, survey: survey1, answer: true)
      end

      it 'returns the correct number (rounded up)' do
        expect(survey1.positive_response_ratio).to eq(67)
        expect(survey1.negative_response_ratio).to eq(33)
      end
    end
  end
end
