class Industry < ApplicationRecord
	#This relation is used to indicate that one industry can has many branches
	has_many :industry_branches, :dependent => :delete_all
	#this relation is used to set up a relation many to many, so the industry has many companies and vice versa
	has_and_belongs_to_many :companies

	# Industry validations
	validates :name, presence: true, length: { in: 2..80}
end
