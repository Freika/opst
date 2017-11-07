# == Schema Information
#
# Table name: heros
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hero < ApplicationRecord
  include Calculateable

  has_many :chosen_heros, dependent: :destroy
  has_many :matches, through: :chosen_heros
end
