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

class Survey < ApplicationRecord
  searchkick word_start: [:question, :category_name], word_middle: [:question, :category_name]

  belongs_to :user
  belongs_to :category
  has_many :responses

  validates_presence_of :question, :user, :category

  def search_data
    {
      question: question,
      category_name: category.name
    }
  end

  def positive_response_ratio
    responses.any? ? ((positive_response_count.to_f / responses.count) * 100.00).round : 0
  end

  def negative_response_ratio
    responses.any? ? ((negative_response_count.to_f / responses.count) * 100.00).round : 0
  end

  def positive_response_count
    responses.where(answer: true).count
  end

  def negative_response_count
    responses.where(answer: false).count
  end
end
