class Order < ApplicationRecord
  has_many :orderitem, dependent: :destroy
  belongs_to :user

  # def oreder_sum(tax)
  #   tax0sum = 0
  #   tax8sum = 0
  #   tax10sum = 0
  #   itempqsum = 0
  #   @cart.each do |item|
  #     p = item.itemprice
  #     q = item.quantity
  #     itempq = p * q
  #     tax = item.item.taxrate


end
