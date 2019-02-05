class CreateJoinTableIndustryBranchSolution < ActiveRecord::Migration[5.2]
  def change
    create_join_table :industry_branches, :solutions, id: false do |t|
      t.belongs_to :solution, index:true,  null: false
      t.belongs_to :industry_branch, index:true,  null: false
      # t.index [:industry_branch_id, :solution_id]
      # t.index [:solution_id, :industry_branch_id]
    end
  end
end
