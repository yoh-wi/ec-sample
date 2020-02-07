class Item < ApplicationRecord
  belongs_to :category, optional: true
  has_many :orderitem

  validates :code, presence: true, uniqueness: true, length: { maximum:13 } 
  validates :name, presence: true
  validates :price, presence: true
end