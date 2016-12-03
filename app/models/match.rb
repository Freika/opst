class Match < ApplicationRecord
  has_many :destinations
  has_many :maps, through: :destinations

  has_many :chosen_heros
  has_many :heros, through: :chosen_heros
  enum result: { draw: 0, lose: 1, win: 2 }
end
