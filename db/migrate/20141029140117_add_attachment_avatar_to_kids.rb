class AddAttachmentAvatarToKids < ActiveRecord::Migration
  def self.up
    change_table :kids do |t|
      t.attachment :kids, :avatar
    end
  end

  def self.down
    remove_attachment :kids, :avatar
  end
end
