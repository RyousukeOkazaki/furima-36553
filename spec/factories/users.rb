FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { 'test56' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    kana_last_name        { 'ヤマダ' }
    kana_first_name       { 'タロウ' }
    nickname              { 'ニックネーム' }
    date_of_birth         { Faker::Date.in_date_period }
  end
end
