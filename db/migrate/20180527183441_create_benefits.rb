class CreateBenefits < ActiveRecord::Migration[5.2]
  def change
    create_table :benefits do |t|
      t.references :solution, foreign_key: true, null: false
      t.string :description, default: ""
      t.integer :validated, default: 0, limit: 1

      t.timestamps
    end
  end
end