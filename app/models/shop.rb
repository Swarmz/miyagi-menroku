class Shop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :address, presence: true

  has_many :visits, dependent: :destroy
  has_many :users, through: :visits
end
