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

FactoryGirl.define do
  factory :map do
    sequence :name do |n|
      "#{n} season"
    end
  end
end
