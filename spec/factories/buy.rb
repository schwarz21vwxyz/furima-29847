FactoryBot.define do
  factory :buy do
    token {'tok_abcdefghijk00000000000000000'}
    postal_code { '123-4567' }
    prefecture_id { '1' }
    city { '札幌市中央区' }
    house_number { '1-1' }
    phone_number { '12345678910' }
    association :user
    association :item
  end
end
