class Map < ApplicationRecord
  include Calculateable

  has_many :destinations
  has_many :matches, through: :destinations

  enum kind: { assault: 1, escort: 2, control: 3, hybrid: 4 }

  def percent_played(matches)
    to_percent(played(matches), matches.count.to_f)
  end

  def played(matches)
    matches.joins(:map).where('maps.id = ?', self.id).count
  end

  def wins(matches)
    matches
      .joins(:map)
      .where('maps.id = ? and result = ?', self.id, Match.results[:win]).count
  end

  def losses(matches)
    matches
      .joins(:map)
      .where('maps.id = ? and result = ?', self.id, Match.results[:lose]).count
  end

  def draws(matches)
    matches
      .joins(:map)
      .where('maps.id = ? and result = ?', self.id, Match.results[:draw]).count
  end

  def wins_percent(matches)
    to_percent(wins(matches), played(matches))
  end

  def losses_percent(matches)
    to_percent(losses(matches), played(matches))
  end

  def draws_percent(matches)
    to_percent(draws(matches), played(matches))
  end
end
