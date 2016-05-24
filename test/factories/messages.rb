FactoryGirl.define do
  factory :message do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    content { Faker::Lorem.sentence }
  end
end
