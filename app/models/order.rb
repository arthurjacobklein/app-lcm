class Order < ApplicationRecord
  belongs_to :account
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_item
end
