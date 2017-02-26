FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    password '00000000'
    password_confirmation '00000000'

    email
  end
end
