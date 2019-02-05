class DropTableHomeTexts < ActiveRecord::Migration[5.2]
  def change
    drop_table :home_texts
  end
end
