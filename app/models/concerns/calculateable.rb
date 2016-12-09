module Calculateable
  extend ActiveSupport::Concern

  def to_percent(part, total)
    ((part.to_f / total.to_f) * 100).round(2)
  end
end
