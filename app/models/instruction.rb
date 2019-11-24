class Instruction < ApplicationRecord
  belongs_to :exercise
  belongs_to :session
  validates :instruction, presence: true
end
