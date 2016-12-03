class Match < ApplicationRecord
  has_one :destination
  has_one :map, through: :destination

  has_many :chosen_heros
  has_many :heros, through: :chosen_heros
  enum result: { draw: 0, lose: 1, win: 2 }

  def update_associations(hero_ids, map_id)
    heroes = Hero.find(hero_ids.reject(&:empty?).map(&:to_i))
    heroes = heroes - self.heros
    heros << heroes
    map = Map.find(map_id)
  end
end
