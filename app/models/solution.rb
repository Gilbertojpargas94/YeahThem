class Solution < ApplicationRecord
  #this relation indicate that each solution belongs to a only one company
  belongs_to :company
  #This relation is used to indicate that one solution can has many  benefits
  has_many :benefits, :dependent => :delete_all
  #these relation is used to set up a relation many to many, so the solution has many branches,clients and vice versa
  has_and_belongs_to_many :industry_branches
  has_and_belongs_to_many :clients
  
  # For permit that the nested resources can by manage on the nested forms with cocoon gem
  accepts_nested_attributes_for :industry_branches, reject_if: :all_blank

  # has_attached_file is a method of the paperclip to work with images.
  # In the hash styles we pass diferents size for the image
  # you can add any name for this fields.
  # default_url is used when the field picture not has a image.
  has_attached_file :picture, styles: {thumb: "100x100", medium: "300x300"}, default_url: "/images/:style/missing_picture.png"
  # This is for security reasons, only images can upload.
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Solution validations
  validates :company_id, :title, :description, presence: true
  validates :status, :validated, inclusion: { in: [0,1]}
  validates :description, length: {maximum: 100} 
  validates :title, length: {maximum: 19} 
  validates :num_validation, :status, :validated, numericality: true

  def self.company_solutions(company_id)
    where('company_id = ?', company_id)
  end

  def update_validation(client_not_exists = true)
    if client_not_exists
      self.validated = 1
      self.num_validation += 1
    end
  end

  def description_trunc
    description.truncate(100, separator: /\s/)
  end
end