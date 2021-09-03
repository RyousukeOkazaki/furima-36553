FactoryBot.define do
  factory :order_address do
    tel { "1234567890" }
    postal_code { '123-4567' }
    city { '大阪市' }
    street { '生野区' }
    building { 'ヴィラ生野' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
