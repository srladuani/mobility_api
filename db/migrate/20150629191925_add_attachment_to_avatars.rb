class AddAttachmentToAvatars < ActiveRecord::Migration
  def up
    add_attachment :avatars, :image
  end

  def down
    remove_attachment :avatar, :image
  end
end
