FactoryBot.define do
  factory :order_delivery do
    Faker::Config.locale = 'ja'
    post_code       { Faker::Address.postcode }
    prefecture_id   { Faker::Number.within(range: 1..47) }
    municipalities  { Faker::Address.city }
    house_number    { Faker::Address.building_number }
    building        { Faker::Address.community }
    phone_number    { Faker::Number.number(digits: 10) }
    token           { "tok_abcdefghijk00000000000000000" }
  end
end
