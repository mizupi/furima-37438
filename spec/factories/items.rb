FactoryBot.define do
  factory :item do
    name              { Faker::String.random(length: 1..40) }
    description       { Faker::Lorem.paragraph }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    status_id         { Faker::Number.between(from: 2, to: 7) }
    cost_id           { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    days_id           { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user

  end
end
