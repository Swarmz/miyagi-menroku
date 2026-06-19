class Shop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :address, presence: true

  has_many :visits, dependent: :destroy
  has_many :users, through: :visits
  
  scope :by_city, ->(city) {
    where(city:) if city.present?
  }

  def self.search(query)
    if query.present?
      where("name ILIKE ?", "%#{query}%")
    else
      all
    end
  end
    
end
