class CreateIndustryBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :industry_branches do |t|
      t.references :industry, foreign_key: true, null: false
      t.string :name, null: false, default: "", limit: 80

      t.timestamps
    end
  end
end
