class Match < ApplicationRecord
  has_one :destination
  has_one :map, through: :destination

  has_many :chosen_heros
  has_many :heros, through: :chosen_heros
  enum result: { draw: 0, lose: 1, win: 2 }
end
