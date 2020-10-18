class AddProfileImageToSkaters < ActiveRecord::Migration[5.2]
  def change
    add_column :skaters, :profile_image, :string
  end
end
