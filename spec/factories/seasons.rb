FactoryGirl.define do
  factory :season do
    sequence :name do |n|
      "#{n} season"
    end
  end
end
