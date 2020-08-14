FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    name {Gimei.name.first.kanji}
    name_reading { Gimei.name.first.katakana}
    fam_name {Gimei.name.last.kanji}
    fam_name_reading {Gimei.name.last.katakana}
    birthday { Faker::Date.between(from: '1931-01-01', to: '2014-09-25') }
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end


