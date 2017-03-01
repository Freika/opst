FactoryGirl.define do
  factory :map do
    sequence :name do |n|
      "#{n} season"
    end
  end
end
