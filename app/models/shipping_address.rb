class ShippingAddress < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :tel
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid.' }
    validates :city, :street
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

end
