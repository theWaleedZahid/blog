class AddAttachmentAvatarToUsers < ActiveRecord::Migration

  def self.down
    remove_attachment :users, :avatar
  end
end
