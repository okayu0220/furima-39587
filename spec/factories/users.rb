FactoryBot.define do
  factory :user do
    gimei = Gimei.name # 日本語の名前を生成
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Alphanumeric.alpha(number: 5) + Faker::Number.number(digits: 5).to_s}
    password_confirmation {password}
    first_name_fw         {gimei.first.kanji}
    last_name_fw          {gimei.last.kanji}
    first_name_kn         {gimei.first.katakana}
    last_name_kn          {gimei.last.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: 5.year.ago)}
  end
end
