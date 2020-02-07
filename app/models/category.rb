class Category < ApplicationRecord
  has_many :items

  validates :code, presence: true, uniqueness: true
end
