class Favorite < ApplicationRecord
	belongs_to :skater
	belongs_to :post
end
