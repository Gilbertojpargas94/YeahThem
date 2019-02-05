class CreateIndustries < ActiveRecord::Migration[5.2]
  def change
    create_table :industries do |t|
      t.string :name, null: false, default: "", limit: 80

      t.timestamps null: false
    end
  end
end
