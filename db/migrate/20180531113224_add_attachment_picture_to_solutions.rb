class AddAttachmentPictureToSolutions < ActiveRecord::Migration[5.2]
  def self.up
    change_table :solutions do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :solutions, :picture
  end
end
