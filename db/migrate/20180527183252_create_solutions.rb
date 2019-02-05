class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.references :company, foreign_key: true, null: false
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :picture
      t.integer :num_validation, default: 0
      t.integer :validated, default: 0, limit: 1
      t.integer :status, default: 1, limit: 1

      t.timestamps
    end
  end
end
