class CreateHomeTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :home_texts do |t|
      t.text :title1
      t.text :subtitle1
      t.text :title2
      t.text :subtitle2
      t.text :title3
      t.text :subtitle3
      t.text :title4
      t.text :subtitle4

      t.timestamps
    end
  end
end
