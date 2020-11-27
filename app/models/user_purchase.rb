class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A0\d{9,10}\z/, message: "Input only number" }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end