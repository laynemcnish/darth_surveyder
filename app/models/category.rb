# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  searchkick word_middle: [:name], word_start: [:name]

  has_many :surveys

  validates :name, presence: true, allow_blank: false

  after_commit :reindex_survey

  def reindex_survey
    surveys.reindex
  end
end
