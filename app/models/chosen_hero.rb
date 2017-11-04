# == Schema Information
#
# Table name: chosen_heros
#
#  id         :integer          not null, primary key
#  hero_id    :integer
#  match_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChosenHero < ApplicationRecord
  belongs_to :match
  belongs_to :hero

  validates :hero_id, uniqueness: { scope: :match_id }
end
