FactoryGirl.define do
  factory :candidate do
    association :job, factory: :job
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    headline { Faker::Lorem.sentence }
    coverletter { Faker::Lorem.paragraph }
    resume { Faker::Internet.url }
  end
end
