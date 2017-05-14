class Map < ApplicationRecord
  include Calculateable

  has_many :destinations, dependent: :destroy
  has_many :matches, through: :destinations

  enum kind: { assault: 1, escort: 2, control: 3, hybrid: 4 }

  def underscore_name
    self.underscore.gsub(/\s|'|:/, '_')
  end
end
