class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :days

  validates :name, presence: true
  validates :description, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } do
    validates :price
  end

  validates :price, numericality: { in: 300..9_999_999, message: 'is out of setting range' }

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :days_id
  end
end
