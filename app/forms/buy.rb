class Buy

  include ActiveModel::Model
  attr_accessor :token, :price, :prefecture_id, :postal_code, :city, :house_number, :building_name,:phone_number, :order_id, :user_id, :item_id


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :phone_number, format: {with: /\A\d{11}\z/,  message: "Input only number"}
    validates :city
    validates :house_number
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0 , message: "Select"} 

  def save
    order = Order.create(user_id: user_id, item_id: item_id,)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end