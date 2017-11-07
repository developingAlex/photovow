class FixAvatarDataName < ActiveRecord::Migration[5.1]
  def change
    rename_column :portfolios, :avatar_data, :avatar_image_data
  end
end
