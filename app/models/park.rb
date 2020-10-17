class Park < ApplicationRecord
	belongs_to :skater
	belongs_to :country
	has_many :posts
end
