FactoryBot.define do
  factory :item do
    name                 { Faker::Name.last_name }
    description          { Faker::Lorem.sentence }
    price                { Faker::Number.between(from: 300, to: 9999999) }
    category_id          { Faker::Number.between(from: 2, to: 11) }
    status_id            { Faker::Number.between(from: 2, to: 7) }
    fee_id               { Faker::Number.between(from: 2, to: 3) }
    prefecture_id        { Faker::Number.between(from: 2, to: 48) }
    delivery_days_id     { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
