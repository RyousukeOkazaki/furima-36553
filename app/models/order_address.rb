class OrderAddress
  include ActiveModel::Model
  attr_accessor :tel, :postal_code, :city, :street, :building, :prefecture_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street
    validates :prefecture_id
    validates :item_id
    validates :user_id
    validates :token
  end
  # validates :building

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(tel: tel, postal_code: postal_code, city: city, street: street, building: building,
                   prefecture_id: prefecture_id, order_id: order.id)
  end
end
