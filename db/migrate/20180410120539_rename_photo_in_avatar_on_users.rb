class RenamePhotoInAvatarOnUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :photo, :avatar
  end
end
