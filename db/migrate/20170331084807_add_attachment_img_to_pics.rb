class AddAttachmentImgToPics < ActiveRecord::Migration
  def self.up
    change_table :pics do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :pics, :img
  end
end
