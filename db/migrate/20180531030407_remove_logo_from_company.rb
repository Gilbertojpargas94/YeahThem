class RemoveLogoFromCompany < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :logo, :string
  end
end
