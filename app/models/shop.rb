class Shop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :address, presence: true
end
