class Exercise < ApplicationRecord
  has_many :instructions
  has_many :sessions, through: :instructions
  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true
end
