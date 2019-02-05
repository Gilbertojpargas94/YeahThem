class Benefit < ApplicationRecord
  #this relation indicate that each benefits belongs to a only one solution
  belongs_to :solution

  # Benefit validations
  validates :solution_id, presence: true
  validates :description, presence: true, length: { maximum: 72 }
  validates :validated, numericality: true, inclusion: { in: [0,1]}
end