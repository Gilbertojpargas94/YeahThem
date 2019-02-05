class CreateJoinTableCompanyIndustry < ActiveRecord::Migration[5.2]
  def change
    create_join_table :companies, :industries, id: false do |t|
      t.belongs_to :company, index:true,  null: false
      t.belongs_to :industry, index:true,  null: false
      # t.index [:company_id, :industry_id]
      # t.index [:industry_id, :company_id]
    end
  end
end
