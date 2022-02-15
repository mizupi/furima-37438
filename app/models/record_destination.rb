class RecordDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number,
                :purchase_record_id, :token

  with_options presence: true do
    validates :token
    validates :user_id, :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city, :address
    validates :phone_number, length: { maximum: 11 },
                             numericality: { only_integer: true, message: 'is invalid. Input only number' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                       building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record_id)
  end
end