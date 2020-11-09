FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, max_length: 20, mix_case: true)}
    password_confirmation {password}
    last_name             {"山本"}
    first_name            {"剛"}
    last_name_kana        {"ヤマモト"}
    first_name_kana       {"ツヨシ"}
    birth                 {"1998-10-10"}
  end
end