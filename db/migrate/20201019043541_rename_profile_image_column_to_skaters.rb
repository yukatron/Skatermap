class RenameProfileImageColumnToSkaters < ActiveRecord::Migration[5.2]
  def change
  	rename_column :skaters, :profile_image, :profile_image_id
  end
end
