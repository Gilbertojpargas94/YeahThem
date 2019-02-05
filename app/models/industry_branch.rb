class IndustryBranch < ApplicationRecord
  belongs_to :industry
  #this relation is used to set up a relation many to many, so the branch has many solutions
  has_and_belongs_to_many :solutions

  # Branch validations
  validates :name, :industry_id, presence: true 
  validates :name, length: { in: 2..80}
end
