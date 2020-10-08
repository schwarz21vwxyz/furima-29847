FactoryBot.define do
  factory :item do
    name {'商品'}
    comment {'コメント'}
    category_id {'2'}
    show_id {'2'}
    delivery_id {'2'}
    area_id {'2'}
    day_id {'2'}
    price {'2000'}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end