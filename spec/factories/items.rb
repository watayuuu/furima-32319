FactoryBot.define do
  factory :item do
    product_name{Faker::Lorem.sentence}
    commentary {Faker::Lorem.sentence}
    category_id {2}
    status_id{2}
    fee_id{2}
    area_id{2}
    deliverydate_id{2}
    price{4000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
