class RemovePictureFromSolution < ActiveRecord::Migration[5.2]
  def change
    remove_column :solutions, :picture, :string
  end
end
