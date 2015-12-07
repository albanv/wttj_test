FactoryGirl.define do
  factory :job do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
