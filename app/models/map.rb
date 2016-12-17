class Map < ApplicationRecord
  include Calculateable

  has_many :destinations
  has_many :matches, through: :destinations

  enum kind: { assault: 1, escort: 2, control: 3, hybrid: 4 }
end
