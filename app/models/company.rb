class Company < ApplicationRecord
  belongs_to :user
  #This relation is used to indicate that one company can has many solutions
  has_many :solutions, dependent: :destroy
  #these relation is used to set up a relation many to many, so the company has many industries,clients and vice versa
  has_and_belongs_to_many :industries

  # has_attached_file is a method of the paperclip to work with images.
  # In the hash styles we pass diferents size for the image
  # you can add any name for this fields.
  # default_url is used when the field logo not has a image.
  has_attached_file :logo, styles: {thumb: "100x100", medium: "300x300"}, default_url: "/images/:style/missing_logo.png"
  # This is for security reasons, only images can upload.
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  
  # Company validations
  validates :name, :user_id, presence: true
  validates :total_validation, :status, numericality: true
  validates :status, inclusion: { in: [0,1]}
end
