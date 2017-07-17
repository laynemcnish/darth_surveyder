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

class User < ApplicationRecord
  has_many :surveys
  has_many :responses

  validates_presence_of :name, :rank
end
