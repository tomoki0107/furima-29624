FactoryBot.define do
  factory :user_purchase do
    postal_code { '123-4567'}
    prefecture_id { 1 }
    municipality { '杉並区' }
    address { '成田東' }
    building { 'ハイツ山根' }
    phone_number { '09982732632' }
  end
end
