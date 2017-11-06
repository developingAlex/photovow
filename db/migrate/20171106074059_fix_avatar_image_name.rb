class FixAvatarImageName < ActiveRecord::Migration[5.1]
  def change
    rename_column :portfolios, :avatar_image_data, :image_data
  end
end
