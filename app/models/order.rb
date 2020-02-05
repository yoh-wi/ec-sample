class Order < ApplicationRecord
  has_many :orderitem, dependent: :destroy
  belongs_to :user
end
