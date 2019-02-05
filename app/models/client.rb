class Client < ApplicationRecord
  #this relation is used to set up a relation many to many, so the client has many solutions and vice versa
  has_and_belongs_to_many :solutions

  # CLient validations
  
  def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |client|
      if auth[:info]
        client.uid = auth[:uid]
        client.provider = auth[:provider]
        client.name = auth[:info][:first_name]
        client.last_name = auth[:info][:last_name]
        client.image_url = auth[:info][:image]
        client.profile_url = auth[:info][:urls][:public_profile]
        client.raw_data = auth[:extra][:raw_info].to_json
      end
    end
  end
end
