class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false, default: ""
      t.string :description, default: ""
      t.string :address, default: ""
      t.string :logo, default: ""
      t.integer :total_validation, default: 0
      t.integer :status, default: 1, limit: 1

      t.timestamps
    end
  end
end

  