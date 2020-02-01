class Item < ApplicationRecord
  belongs_to :category, optional: true
  has_many :orderitem
end