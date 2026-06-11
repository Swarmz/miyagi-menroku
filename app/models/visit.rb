class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :visited_on, presence: true
  validates :menu_item, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
