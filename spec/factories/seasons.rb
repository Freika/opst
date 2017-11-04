# == Schema Information
#
# Table name: seasons
#
#  id          :integer          not null, primary key
#  name        :string
#  finishes_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :season do
    sequence :name do |n|
      "#{n} season"
    end
    finishes_at 7.days.from_now
  end
end
