class RenameImageClumToParks < ActiveRecord::Migration[5.2]
  def change
  	rename_column :parks, :image, :image_id
  end
end
