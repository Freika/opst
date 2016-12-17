module Calculateable
  extend ActiveSupport::Concern

  def to_percent(part, total)
    value = ((part.to_f / total.to_f) * 100).round(2)
    value.nan? ? 0.0 : value
  end
end
