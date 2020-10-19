class Comment < ApplicationRecord
	belongs_to :skater
	belongs_to :post
end
