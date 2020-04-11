class Item < ApplicationRecord
  belongs_to :category, optional: true
  has_many :orderitems

  validates :category, presence: true
  validates :code, presence: true, uniqueness: true, length: { maximum:13 } 
  validates :name, presence: true
  validates :price, presence: true
  validates :taxrate, presence: true

  mount_uploader :image, ImageUploader
end