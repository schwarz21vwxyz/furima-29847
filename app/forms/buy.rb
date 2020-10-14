class Buy

  include ActiveModel::Model
  attr_accessor :token, :price, :prefecture_id, :postal_code, :city, :house_number, :building_name,:phone_number, :order_id, :user_id, :item_id


  # with_options presence: true do
  #   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # end

  def save
    order = Order.create(user_id: user_id, item_id: item_id,)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)

  end
end