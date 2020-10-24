class RemoveLatitudeFromParks < ActiveRecord::Migration[5.2]
	def up
		remove_column :parks, :latitude
		remove_column :parks, :longitude
	end

	def down
		add_column :parks, :latitude, :float
    	add_column :parks, :longitude, :float
	end
end
