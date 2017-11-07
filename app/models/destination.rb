# == Schema Information
#
# Table name: destinations
#
#  id         :integer          not null, primary key
#  match_id   :integer
#  map_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Destination < ApplicationRecord
  belongs_to :map
  belongs_to :match
end
