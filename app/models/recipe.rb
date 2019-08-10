class Recipe < ApplicationRecord
  validates :name, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :category, presence: true

  belongs_to :user
end
