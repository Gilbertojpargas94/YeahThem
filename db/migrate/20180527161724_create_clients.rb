class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.integer :person_id, null: false, default: 0

      t.timestamps
    end
  end
end
