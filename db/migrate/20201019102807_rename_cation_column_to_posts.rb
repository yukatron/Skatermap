class RenameCationColumnToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :cation, :caption
  end
end
