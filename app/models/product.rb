class Product < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_item
  has_many_attached :product_images
  belongs_to :brand
  scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
end
