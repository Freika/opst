class ChosenHero < ApplicationRecord
  belongs_to :match
  belongs_to :hero

  validates :hero_id, uniqueness: { scope: :match_id }
end
