class Country < ApplicationRecord
	has_many :parks
	belongs_to :skater
end
