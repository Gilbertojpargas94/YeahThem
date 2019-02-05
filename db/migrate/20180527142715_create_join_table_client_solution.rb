class CreateJoinTableClientSolution < ActiveRecord::Migration[5.2]
  def change
    create_join_table :clients, :solutions, id: false do |t|
      t.belongs_to :solution, index:true,  null: false
      t.belongs_to :client, index:true,  null: false
      # t.index [:client_id, :solution_id]
      # t.index [:solution_id, :client_id]
    end
  end
end
