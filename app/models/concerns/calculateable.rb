module Calculateable
  extend ActiveSupport::Concern

  def to_percent(part, total)
    value = ((part.to_f / total.to_f) * 100).round(2)
    value.nan? ? 0.0 : value
  end

  def percent_played(matches)
    to_percent(played(matches), matches.size)
  end

  def played(matches)
    if self.is_a?(Map)
      matches.joins(:map).where('maps.id = ?', self.id).size
    elsif self.is_a?(Hero)
      matches.joins(:heros).where('heros.id = ?', self.id).size
    end
  end

  def wins(matches)
    if self.is_a?(Map)
      matches
        .joins(:map)
        .where('maps.id = ? and result = ?', self.id, Match.results[:win]).size
    elsif self.is_a?(Hero)
      matches
        .joins(:heros)
        .where('heros.id = ? and result = ?', self.id, Match.results[:win]).size
    end
  end

  def losses(matches)
    if self.is_a?(Map)
      matches
        .joins(:map)
        .where('maps.id = ? and result = ?', self.id, Match.results[:lose]).size
    elsif self.is_a?(Hero)
      matches
        .joins(:heros)
        .where('heros.id = ? and result = ?', self.id, Match.results[:lose]).size
    end
  end

  def draws(matches)
    if self.is_a?(Map)
      matches
        .joins(:map)
        .where('maps.id = ? and result = ?', self.id, Match.results[:draw]).size
    elsif self.is_a?(Hero)
      matches
        .joins(:heros)
        .where('heros.id = ? and result = ?', self.id, Match.results[:draw]).size
    end
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
