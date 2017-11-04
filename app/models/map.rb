# == Schema Information
#
# Table name: maps
#
#  id         :integer          not null, primary key
#  name       :string
#  kind       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Map < ApplicationRecord
  include Calculateable

  has_many :destinations, dependent: :destroy
  has_many :matches, through: :destinations

  enum kind: { assault: 1, escort: 2, control: 3, hybrid: 4 }

  def underscore_name
    self.name.underscore.gsub(/\s|'|:/, '_')
  end
end
