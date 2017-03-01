FactoryGirl.define do
  factory :hero do
    sequence :name do |n|
      "#{n} season"
    end
  end
end
