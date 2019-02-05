class AddProviderToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :provider, :string
    add_column :clients, :uid, :string
    add_column :clients, :name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :image_url, :string
    add_column :clients, :profile_url, :string
    add_column :clients, :access_token, :string
    add_column :clients, :company_name, :string
    add_column :clients, :title, :string
    add_column :clients, :raw_data, :string
  end
end
