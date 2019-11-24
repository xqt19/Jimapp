class Session < ApplicationRecord
  has_many :instructions, dependent: :destroy
  has_many :exercises, through: :instructions
  validates :name, presence: true
  validates :category, presence: true
end
