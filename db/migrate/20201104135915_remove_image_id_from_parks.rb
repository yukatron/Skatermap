class RemoveImageIdFromParks < ActiveRecord::Migration[5.2]
  def up
  	remove_column :parks, :image_id, :string
  end
  def down
  	rename_column :parks, :image, :image_id
  	add_column :parks, :image, :string
  end
end
