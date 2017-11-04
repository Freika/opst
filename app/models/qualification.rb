# == Schema Information
#
# Table name: qualifications
#
#  id           :integer          not null, primary key
#  skill_rating :integer
#  wins         :integer
#  losses       :integer
#  draws        :integer
#  season_id    :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Qualification < ApplicationRecord
  BRONZE      = { name: 'Bronze', range: 1..1499 }
  SILVER      = { name: 'Silver', range: 1500..1999 }
  GOLD        = { name: 'Gold', range: 2000..2499 }
  PLATINUM    = { name: 'Platinum', range: 2500..2999 }
  DIAMOND     = { name: 'Diamond', range: 3000..3499 }
  MASTER      = { name: 'Master', range: 3500..3999 }
  GRANDMASTER = { name: 'Grandmaster', range: 4000..5000 }

  LEAGUES = [BRONZE, SILVER, GOLD, PLATINUM, DIAMOND, MASTER, GRANDMASTER]

  belongs_to :season
  belongs_to :user
end
