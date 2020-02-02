class Orderitem < ApplicationRecord
  belongs_to :item, optional:true
  belongs_to :cart, optional: true
  belongs_to :order, optional: true
end
