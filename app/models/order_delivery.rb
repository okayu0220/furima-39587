class OrderDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :house_number, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code,       format: { with: /\A[\d]{3}-[\d]{4}\z/ }
    validates :prefecture_id,   numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :house_number
    validates :phone_number,    format: { with: /\A[\d]{10,11}\z/ }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      municipalities: municipalities, 
      house_number: house_number,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end

end